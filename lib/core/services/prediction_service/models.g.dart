// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PredictionHistoryImpl _$$PredictionHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$PredictionHistoryImpl(
      createMoment: json['createMoment'] as String,
      gameName: json['gameName'] as String,
      gameEndMoment: json['gameEndMoment'] as String,
      gameStopMoment: json['gameStopMoment'] as String,
      tokenSymbol: json['tokenSymbol'] as String,
      tokenName: json['tokenName'] as String,
      predictionTokenAmount: (json['predictionTokenAmount'] as num).toDouble(),
      state: $enumDecode(_$PredictionStateEnumMap, json['state']),
      canEdit: json['canEdit'] as bool,
    );

Map<String, dynamic> _$$PredictionHistoryImplToJson(
        _$PredictionHistoryImpl instance) =>
    <String, dynamic>{
      'createMoment': instance.createMoment,
      'gameName': instance.gameName,
      'gameEndMoment': instance.gameEndMoment,
      'gameStopMoment': instance.gameStopMoment,
      'tokenSymbol': instance.tokenSymbol,
      'tokenName': instance.tokenName,
      'predictionTokenAmount': instance.predictionTokenAmount,
      'state': _$PredictionStateEnumMap[instance.state]!,
      'canEdit': instance.canEdit,
    };

const _$PredictionStateEnumMap = {
  PredictionState.pending: 'Pending',
  PredictionState.active: 'Active',
  PredictionState.lose: 'Lose',
  PredictionState.win: 'Win',
};
