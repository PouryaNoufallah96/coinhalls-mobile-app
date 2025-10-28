// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppHealthStatusImpl _$$AppHealthStatusImplFromJson(
        Map<String, dynamic> json) =>
    _$AppHealthStatusImpl(
      checked: json['checked'] as bool,
      systemHealth: json['systemHealth'] as bool,
      systemActivity: json['systemActivity'] as bool,
      activityMessage: json['activityMessage'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$AppHealthStatusImplToJson(
        _$AppHealthStatusImpl instance) =>
    <String, dynamic>{
      'checked': instance.checked,
      'systemHealth': instance.systemHealth,
      'systemActivity': instance.systemActivity,
      'activityMessage': instance.activityMessage,
      'message': instance.message,
    };
