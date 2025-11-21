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
      predictionReference: json['predictionReference'] as String,
      gameStopMoment: json['gameStopMoment'] as String,
      tokenSymbol: json['tokenSymbol'] as String,
      tokenName: json['tokenName'] as String,
      predictionTokenAmount: (json['predictionTokenAmount'] as num).toDouble(),
      predictionTokenAmountInWei: json['predictionTokenAmountInWei'] as String,
      registerPayAmount: (json['registerPayAmount'] as num).toDouble(),
      registerPayAmountInWei: json['registerPayAmountInWei'] as String,
      state: $enumDecode(_$PredictionStateEnumMap, json['state']),
      canEdit: json['canEdit'] as bool,
      gameTitle: json['gameTitle'] as String?,
    );

Map<String, dynamic> _$$PredictionHistoryImplToJson(
        _$PredictionHistoryImpl instance) =>
    <String, dynamic>{
      'createMoment': instance.createMoment,
      'gameName': instance.gameName,
      'gameEndMoment': instance.gameEndMoment,
      'predictionReference': instance.predictionReference,
      'gameStopMoment': instance.gameStopMoment,
      'tokenSymbol': instance.tokenSymbol,
      'tokenName': instance.tokenName,
      'predictionTokenAmount': instance.predictionTokenAmount,
      'predictionTokenAmountInWei': instance.predictionTokenAmountInWei,
      'registerPayAmount': instance.registerPayAmount,
      'registerPayAmountInWei': instance.registerPayAmountInWei,
      'state': _$PredictionStateEnumMap[instance.state]!,
      'canEdit': instance.canEdit,
      'gameTitle': instance.gameTitle,
    };

const _$PredictionStateEnumMap = {
  PredictionState.pending: 'Pending',
  PredictionState.active: 'Active',
  PredictionState.lose: 'Lose',
  PredictionState.win: 'Win',
};
