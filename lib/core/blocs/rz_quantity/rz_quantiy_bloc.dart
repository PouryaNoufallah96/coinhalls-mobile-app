import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coin_hall/core/services/socket_service/socket_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rz_quantiy_bloc.freezed.dart';
part 'rz_quantiy_event.dart';
part 'rz_quantiy_state.dart';

class RzQuantiyBloc extends Bloc<RzQuantiyEvent, RzQuantiyState> {
  RzQuantiyBloc({
    required SocketService socketService,
  })  : _socketService = socketService,
        super(const _RzQuantiyState()) {
    on<_Started>(_onStarted);
  }

  final SocketService _socketService;

  Future<void> _onStarted(
    _Started event,
    Emitter<RzQuantiyState> emit,
  ) async {
    final stream = _socketService.stream
        .where((event) => event.name == 'NotifyInventory')
        .map((event) => event.data)
        .transform(StreamTransformer<dynamic, double>.fromHandlers(
      handleData: (data, sink) {
        try {
          final value = (data as Map<String, dynamic>)['quantity'] as num;
          sink.add(value.toDouble());
        } catch (_) {}
      },
    ));

    await emit.forEach(
      stream,
      onData: (data) {
        return RzQuantiyState(available: data);
      },
    );
  }
}
