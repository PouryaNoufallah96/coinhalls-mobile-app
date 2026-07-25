import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coin_hall/core/services/auth_interceptor/auth_interceptor.dart';
import 'package:coin_hall/core/services/auth_service/auth_service.dart';
import 'package:coin_hall/core/services/auth_service/models.dart';
import 'package:coin_hall/core/services/reown/reown.dart';
import 'package:coin_hall/core/services/socket_service/socket_service.dart';
import 'package:coin_hall/core/utils/future_timeout.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:reown_appkit/reown_appkit.dart';
import 'package:toastification/toastification.dart';

part 'reown_event.dart';
part 'reown_state.dart';

class ReownBloc extends Bloc<ReownEvent, ReownState> {
  ReownBloc({
    required ReownService reownService,
    required AuthService authService,
    required SocketService socketService,
    required AuthInterceptor authInterceptor,
  })  : _mainReownService = reownService,
        _authService = authService,
        _authInterceptor = authInterceptor,
        _socketService = socketService,
        super(ReownState()) {
    on<ReownStarted>(_onReownStarted);
    on<ReownConnected>(_onReownConnected);
    on<ReownDisconnected>(_onReownDisConnected);
    on<ReownLogginButtonPressed>(_onReownLogginButtonPressed);
    on<ReownAddressLogginButtonPressed>(_onReownAddressLogginButtonPressed);
  }
  final AuthService _authService;
  final ReownService _mainReownService;
  final AuthInterceptor _authInterceptor;
  final SocketService _socketService;

  late StreamSubscription<ModalConnect>? _sub;

  Future<void> _onReownStarted(
    ReownStarted event,
    Emitter<ReownState> emit,
  ) async {
    _sub = _mainReownService.onModalConnectStream.listen((event) async {
      add(ReownConnected(event: event));
    });

    _mainReownService.onModalDisconnectStream.listen((event) {
      if (!isClosed) {
        add(ReownDisconnected());
      }
    });
  }

  Future<void> _onReownDisConnected(
    ReownDisconnected event,
    Emitter<ReownState> emit,
  ) async {
    emit(state.copyWith(
      address: () => null,
      nonce: () => null,
    ));

    if (state.manualAddress == null) {
      _authInterceptor.clear();
    }
  }

  Future<void> _onReownConnected(
    ReownConnected event,
    Emitter<ReownState> emit,
  ) async {
    try {
      final appKitModal = _mainReownService.appKitModal;

      if (appKitModal.selectedChain == null) {
        await appKitModal.selectChain(
          ReownAppKitModalNetworks.getNetworkInfo('eip155', '56'),
          switchChain: true,
        );
      }

      final topic = event.event.session.topic;

      final chainId = appKitModal.selectedChain!.chainId;

      final namespace = NamespaceUtils.getNamespaceFromChain(
        chainId,
      );

      final rawAddress = event.event.session.getAddress(namespace)!;

      final EthereumAddress(:eip55With0x) = EthereumAddress.fromHex(rawAddress);
      if (state.manualAddress != null &&
          eip55With0x != EthereumAddress.fromHex(state.manualAddress!).eip55With0x) {
        emit(state.copyWith(
          status: AppReownLoadingStatus.none,
          address: () => null,
        ));
        await appKitModal.disconnect();

        toastification.show(
          style: ToastificationStyle.fillColored,
          type: ToastificationType.error,
          title: const Text(
              // ignore: lines_longer_than_80_chars
              'Wallet mismatch detected. Please select the same wallet address you used to log in'),
          borderRadius: BorderRadius.circular(6),
          autoCloseDuration: const Duration(seconds: 4),
        );

        return;
      }

      if (state.manualAddress != null &&
          eip55With0x == EthereumAddress.fromHex(state.manualAddress!).eip55With0x) {
        emit(state.copyWith(
          manualAddress: () => null,
          address: () => EthereumAddress.fromHex(state.manualAddress!).eip55With0x,
        ));
      }

      emit(state.copyWith(
        status: AppReownLoadingStatus.getNonce,
      ));

      final nonce = await _authService.getNonce(eip55With0x);

      emit(state.copyWith(
        status: AppReownLoadingStatus.none,
      ));

      if (nonce == null) {
        emit(state.copyWith(
          status: AppReownLoadingStatus.none,
          address: () => null,
        ));
        await _mainReownService.appKitModal.disconnect();

        return;
      }

      toastification.show(
        style: ToastificationStyle.fillColored,
        type: ToastificationType.success,
        title: const Text('Wallet connected! Please sign the message..'),
        borderRadius: BorderRadius.circular(6),
        autoCloseDuration: const Duration(seconds: 4),
      );

      emit(state.copyWith(
        nonce: () => nonce,
        address: () => eip55With0x,
      ));

      emit(state.copyWith(
        status: AppReownLoadingStatus.signing,
      ));

      final signature = await futureTimeout(
        appKitModal.request(
          topic: topic,
          chainId: chainId,
          request: SessionRequestParams(
            method: 'personal_sign',
            params: [nonce.message, eip55With0x],
          ),
        ),
        const Duration(seconds: 30),
        () {
          emit(state.copyWith(
            status: AppReownLoadingStatus.none,
          ));
          toastification.show(
            style: ToastificationStyle.fillColored,
            type: ToastificationType.error,
            title: const Text(
                'Connection timed out! Please reconnect your wallet.'),
            borderRadius: BorderRadius.circular(6),
            autoCloseDuration: const Duration(seconds: 4),
          );
        },
      );

      emit(state.copyWith(
        status: AppReownLoadingStatus.none,
      ));

      if (signature is String) {
        _authInterceptor.setSignature(signature);
        add(ReownLogginButtonPressed(onSuccess: event.onSuccess));
      }
    } catch (_) {}
  }

  Future<void> _onReownLogginButtonPressed(
    ReownLogginButtonPressed event,
    Emitter<ReownState> emit,
  ) async {
    _authInterceptor.check();

    if (!_mainReownService.appKitModal.isConnected) {
      await _mainReownService.appKitModal.openModalView();
      return;
    }

    if (_authInterceptor.stream.value.signature == null) {
      if (_mainReownService.appKitModal.session != null) {
        add(
          ReownConnected(
            event: ModalConnect(_mainReownService.appKitModal.session!),
            onSuccess: event.onSuccess,
          ),
        );
      }

      return;
    } else if (state.nonce != null && state.address != null) {
      final signature = _authInterceptor.stream.value.signature!.signature;

      emit(state.copyWith(
        status: AppReownLoadingStatus.getToken,
      ));

      final token = await _authService.getToken(
        walletAddress: state.address!,
        nonce: state.nonce!.nonce,
        signature: signature,
      );

      emit(state.copyWith(
        status: AppReownLoadingStatus.none,
      ));

      if (token != null) {
        _authInterceptor.setToken(token);

        try {
          unawaited(_mainReownService.appKitModal.loadAccountData());
        } catch (_) {}

        await _socketService.startPrediction(state.address!);
        print(event.onSuccess);
        event.onSuccess?.call();
        toastification.show(
          style: ToastificationStyle.fillColored,
          type: ToastificationType.success,
          title: const Text('Logged in successfully!'),
          borderRadius: BorderRadius.circular(6),
          autoCloseDuration: const Duration(seconds: 4),
        );
      } else {
        emit(state.copyWith(
          status: AppReownLoadingStatus.none,
          address: () => null,
        ));
        await _mainReownService.appKitModal.disconnect();
      }
    }
  }

  Future<void> _onReownAddressLogginButtonPressed(
    ReownAddressLogginButtonPressed event,
    Emitter<ReownState> emit,
  ) async {
    emit(state.copyWith(manualLoginStatus: ManualLoginStatus.inLoading));

    try {
      final token = await _authService.getTokenWithWalletAddress(
          walletAddress: event.address);

      if (token == null) {
        throw Exception();
      }

      emit(state.copyWith(
        manualLoginStatus: ManualLoginStatus.success,
        manualAddress: () => event.address,
        address: () => null,
      ));

      await Future<void>.delayed(const Duration(milliseconds: 500));
      _authInterceptor.setToken(token);
      await _socketService.startPrediction(event.address);
    } catch (e) {
      emit(state.copyWith(manualLoginStatus: ManualLoginStatus.failure));
    } finally {
      emit(state.copyWith(manualLoginStatus: ManualLoginStatus.idle));
    }
  }

  @override
  Future<void> close() async {
    await _sub?.cancel();
    await super.close();
  }
}
