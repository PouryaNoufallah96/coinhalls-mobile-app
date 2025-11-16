// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameCategoryImpl _$$GameCategoryImplFromJson(Map<String, dynamic> json) =>
    _$GameCategoryImpl(
      activeGameCounts: (json['activeGameCounts'] as num).toInt(),
      tokenAddress: json['tokenAddress'] as String?,
      tokenSymbol: json['tokenSymbol'] as String?,
      tokenName: json['tokenName'] as String?,
    );

Map<String, dynamic> _$$GameCategoryImplToJson(_$GameCategoryImpl instance) =>
    <String, dynamic>{
      'activeGameCounts': instance.activeGameCounts,
      'tokenAddress': instance.tokenAddress,
      'tokenSymbol': instance.tokenSymbol,
      'tokenName': instance.tokenName,
    };

_$GameDataImpl _$$GameDataImplFromJson(Map<String, dynamic> json) =>
    _$GameDataImpl(
      state: $enumDecode(_$GameDataStateEnumMap, json['state']),
      prizeValue: (json['prizeValue'] as num).toDouble(),
      targetValue: (json['targetValue'] as num).toDouble(),
      tokenSymbol: json['tokenSymbol'] as String,
      tokenName: json['tokenName'] as String,
      gameName: json['gameName'] as String,
      startTime: json['startTime'] as String,
      stopTime: json['stopTime'] as String,
      endTime: json['endTime'] as String,
      attachmentUrl: json['attachmentUrl'] as String,
      gameReference: json['gameReference'] as String,
      tokenAddress: json['tokenAddress'] as String?,
      description: json['description'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$GameDataImplToJson(_$GameDataImpl instance) =>
    <String, dynamic>{
      'state': _$GameDataStateEnumMap[instance.state]!,
      'prizeValue': instance.prizeValue,
      'targetValue': instance.targetValue,
      'tokenSymbol': instance.tokenSymbol,
      'tokenName': instance.tokenName,
      'gameName': instance.gameName,
      'startTime': instance.startTime,
      'stopTime': instance.stopTime,
      'endTime': instance.endTime,
      'attachmentUrl': instance.attachmentUrl,
      'gameReference': instance.gameReference,
      'tokenAddress': instance.tokenAddress,
      'description': instance.description,
      'title': instance.title,
    };

const _$GameDataStateEnumMap = {
  GameDataState.notStarted: 'NotStarted',
  GameDataState.active: 'Active',
  GameDataState.finished: 'Finished',
  GameDataState.cancel: 'Cancel',
};
