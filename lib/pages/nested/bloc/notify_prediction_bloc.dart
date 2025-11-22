import 'package:bloc/bloc.dart';
import 'package:coin_hall/core/services/socket_service/socket_service.dart';
import 'package:flutter/material.dart' as mt;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:toastification/toastification.dart';

part 'notify_prediction_bloc.freezed.dart';
part 'notify_prediction_event.dart';
part 'notify_prediction_state.dart';

class NotifyPredictionBloc
    extends Bloc<NotifyPredictionEvent, NotifyPredictionState> {
  NotifyPredictionBloc({required SocketService socketService})
      : _service = socketService,
        super(const _NotifyPredictionState()) {
    on<_Started>(_onStarted);
  }

  final SocketService _service;

  Future<void> _onStarted(
    _Started event,
    Emitter<NotifyPredictionState> emit,
  ) async {
    final stream = _service.stream.where((event) =>
        event.name.toLowerCase() == 'predictionMessage'.toLowerCase());

    await emit.onEach(stream, onData: (event) async {
      await Future<void>.delayed(const Duration(milliseconds: 800));
      final data = event.data as String?;

      toastification.show(
        style: ToastificationStyle.fillColored,
        type: (data?.toLowerCase().contains('success') ?? false)
            ? ToastificationType.success
            : ToastificationType.error,
        title: mt.Text(data ?? ''),
        borderRadius: mt.BorderRadius.circular(6),
        autoCloseDuration: const Duration(seconds: 4),
      );

      emit(_NotifyPredictionState(
        lastUpdateTime: DateTime.now().microsecondsSinceEpoch,
      ));
    });
  }
}
