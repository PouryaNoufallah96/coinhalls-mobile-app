// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenPriceImpl _$$TokenPriceImplFromJson(Map<String, dynamic> json) =>
    _$TokenPriceImpl(
      tokenName: json['tokenName'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$TokenPriceImplToJson(_$TokenPriceImpl instance) =>
    <String, dynamic>{
      'tokenName': instance.tokenName,
      'price': instance.price,
    };
