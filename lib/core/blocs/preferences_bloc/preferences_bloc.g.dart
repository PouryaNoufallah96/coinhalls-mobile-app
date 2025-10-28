// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreferencesState _$PreferencesStateFromJson(Map<String, dynamic> json) =>
    PreferencesState(
      isDark: json['isDark'] as bool? ?? false,
      isOnBoardingPass: json['isOnBoardingPass'] as bool? ?? false,
      isTermsAccepted: json['isTermsAccepted'] as bool? ?? false,
    );

Map<String, dynamic> _$PreferencesStateToJson(PreferencesState instance) =>
    <String, dynamic>{
      'isOnBoardingPass': instance.isOnBoardingPass,
      'isDark': instance.isDark,
      'isTermsAccepted': instance.isTermsAccepted,
    };
