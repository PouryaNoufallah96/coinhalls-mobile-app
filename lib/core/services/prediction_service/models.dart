import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class PredictionHistory with _$PredictionHistory {
  const factory PredictionHistory({
    required String createMoment,
    required String gameName,
    required String gameEndMoment,
    required String predictionReference,
    required String gameStopMoment,
    required String tokenSymbol,
    required String tokenName,
    required double predictionTokenAmount,
    required String predictionTokenAmountInWei,
    required double registerPayAmount,
    required String registerPayAmountInWei,
    required PredictionState state,
    required bool canEdit,
  }) = _PredictionHistory;

  factory PredictionHistory.fromJson(Map<String, dynamic> json) =>
      _$PredictionHistoryFromJson(json);
}

enum PredictionState {
  @JsonValue('Pending')
  pending('Pending'),
  @JsonValue('Active')
  active('Active'),
  @JsonValue('Lose')
  lose('Lose'),
  @JsonValue('Win')
  win('Win');

  const PredictionState(this.name);
  final String name;
}
