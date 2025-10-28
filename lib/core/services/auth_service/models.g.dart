// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NonceDataImpl _$$NonceDataImplFromJson(Map<String, dynamic> json) =>
    _$NonceDataImpl(
      nonce: json['nonce'] as String,
      message: json['message'] as String,
      expireMoment: json['expireMoment'] as String,
    );

Map<String, dynamic> _$$NonceDataImplToJson(_$NonceDataImpl instance) =>
    <String, dynamic>{
      'nonce': instance.nonce,
      'message': instance.message,
      'expireMoment': instance.expireMoment,
    };
