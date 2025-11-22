part of 'notify_prediction_bloc.dart';

@freezed
class NotifyPredictionState with _$NotifyPredictionState {
  const factory NotifyPredictionState({
    int? lastUpdateTime,
  }) = _NotifyPredictionState;
}
