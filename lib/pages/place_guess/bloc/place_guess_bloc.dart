import 'package:bloc/bloc.dart';
import 'package:coin_hall/core/services/game_service/models.dart';
import 'package:coin_hall/core/services/prediction_service/prediction_service.dart';
import 'package:coin_hall/core/services/transaction_service/transaction_service.dart';
import 'package:coin_hall/core/utils/future_timeout.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

part 'place_guess_event.dart';
part 'place_guess_state.dart';

class PlaceGuessBloc extends Bloc<PlaceGuessEvent, PlaceGuessState> {
  PlaceGuessBloc({
    required TransactionService transactionService,
    required PredictionService predictionService,
    required GameData gameData,
  })  : _transactionService = transactionService,
        _predictionService = predictionService,
        _gameData = gameData,
        super(PlaceGuessState()) {
    on<PlaceGuessAdded>(_onPlaceGuessAdded);
    on<PlaceGuessDeleted>(_onPlaceGuessDeleted);
    on<PlaceGuessPayed>(_onPlaceGuessPayed);
  }

  final TransactionService _transactionService;
  final PredictionService _predictionService;
  final GameData _gameData;

  void _onPlaceGuessAdded(
    PlaceGuessAdded event,
    Emitter<PlaceGuessState> emit,
  ) {
    final newGuess = GameGuess(id: state.guesses.length, amount: event.amount);
    emit(state.copyWith(guesses: [...state.guesses, newGuess]));
  }

  void _onPlaceGuessDeleted(
    PlaceGuessDeleted event,
    Emitter<PlaceGuessState> emit,
  ) {
    emit(
      state.copyWith(
        guesses: [
          for (final i in state.guesses)
            if (i.id != event.id) i
        ],
      ),
    );
  }

  Future<void> _onPlaceGuessPayed(
    PlaceGuessPayed event,
    Emitter<PlaceGuessState> emit,
  ) async {
    emit(state.copyWith(payStatus: PayGameGuessStatus.inProgress));

    final data =
        await _predictionService.addPrediction(_gameData.gameReference, [
      ...state.guesses.map((e) => e.amount).toSet(),
    ]);

    if (data.isEmpty) {
      emit(state.copyWith(payStatus: PayGameGuessStatus.idle));
      return;
    }

    final sum = data.fold(BigInt.zero, (p, e) {
      return p + BigInt.parse(e.registerPayAmountInWei);
    });

    final approved = await futureTimeout(
      _transactionService.approve(
        sum,
        _gameData.tokenAddress!,
        _gameData.tokenName.toLowerCase(),
      ),
      const Duration(seconds: 30),
      () {
        emit(state.copyWith(payStatus: PayGameGuessStatus.idle));

        toastification.show(
          style: ToastificationStyle.fillColored,
          type: ToastificationType.error,
          title: const Text('There was a problem connecting to your wallet.'),
          borderRadius: BorderRadius.circular(6),
          autoCloseDuration: const Duration(seconds: 4),
        );
      },
    );

    if (approved == null || !approved) {
      emit(state.copyWith(payStatus: PayGameGuessStatus.idle));

      toastification.show(
        style: ToastificationStyle.fillColored,
        type: ToastificationType.error,
        title: const Text('The transaction was rejected.'),
        borderRadius: BorderRadius.circular(6),
        autoCloseDuration: const Duration(seconds: 4),
      );

      return;
    }

    final items =
        data.map((e) => BigInt.parse(e.predictionTokenAmountInWei)).toList();

    final isPayed = await futureTimeout(
      _transactionService.payOrder(items, _gameData.gameReference),
      const Duration(seconds: 120),
      () {
        emit(state.copyWith(payStatus: PayGameGuessStatus.idle));

        toastification.show(
          style: ToastificationStyle.fillColored,
          type: ToastificationType.error,
          title: const Text('There was a problem connecting to your wallet.'),
          borderRadius: BorderRadius.circular(6),
          autoCloseDuration: const Duration(seconds: 4),
        );
      },
    );

    if (isPayed != null) {
      emit(state.copyWith(payStatus: PayGameGuessStatus.success));

      if (isPayed) {
        toastification.show(
          style: ToastificationStyle.fillColored,
          type: ToastificationType.success,
          title: const Text('Success'),
          borderRadius: BorderRadius.circular(6),
          autoCloseDuration: const Duration(seconds: 4),
        );
      } else {
        toastification.show(
          style: ToastificationStyle.fillColored,
          type: ToastificationType.error,
          title: const Text('Transaction failed or reverted.'),
          borderRadius: BorderRadius.circular(6),
          autoCloseDuration: const Duration(seconds: 4),
        );
      }
    } else {
      emit(state.copyWith(payStatus: PayGameGuessStatus.idle));
    }
  }
}
