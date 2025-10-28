part of 'rz_quantiy_bloc.dart';

@freezed
class RzQuantiyState with _$RzQuantiyState {
  const factory RzQuantiyState({
    @Default(0) double available,
  }) = _RzQuantiyState;
}
