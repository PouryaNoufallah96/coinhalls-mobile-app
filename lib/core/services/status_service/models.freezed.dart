// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppHealthStatus _$AppHealthStatusFromJson(Map<String, dynamic> json) {
  return _AppHealthStatus.fromJson(json);
}

/// @nodoc
mixin _$AppHealthStatus {
  bool get checked => throw _privateConstructorUsedError;
  bool get systemHealth => throw _privateConstructorUsedError;
  bool get systemActivity => throw _privateConstructorUsedError;
  String? get activityMessage => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this AppHealthStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppHealthStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppHealthStatusCopyWith<AppHealthStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppHealthStatusCopyWith<$Res> {
  factory $AppHealthStatusCopyWith(
          AppHealthStatus value, $Res Function(AppHealthStatus) then) =
      _$AppHealthStatusCopyWithImpl<$Res, AppHealthStatus>;
  @useResult
  $Res call(
      {bool checked,
      bool systemHealth,
      bool systemActivity,
      String? activityMessage,
      String? message});
}

/// @nodoc
class _$AppHealthStatusCopyWithImpl<$Res, $Val extends AppHealthStatus>
    implements $AppHealthStatusCopyWith<$Res> {
  _$AppHealthStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppHealthStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checked = null,
    Object? systemHealth = null,
    Object? systemActivity = null,
    Object? activityMessage = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      checked: null == checked
          ? _value.checked
          : checked // ignore: cast_nullable_to_non_nullable
              as bool,
      systemHealth: null == systemHealth
          ? _value.systemHealth
          : systemHealth // ignore: cast_nullable_to_non_nullable
              as bool,
      systemActivity: null == systemActivity
          ? _value.systemActivity
          : systemActivity // ignore: cast_nullable_to_non_nullable
              as bool,
      activityMessage: freezed == activityMessage
          ? _value.activityMessage
          : activityMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppHealthStatusImplCopyWith<$Res>
    implements $AppHealthStatusCopyWith<$Res> {
  factory _$$AppHealthStatusImplCopyWith(_$AppHealthStatusImpl value,
          $Res Function(_$AppHealthStatusImpl) then) =
      __$$AppHealthStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool checked,
      bool systemHealth,
      bool systemActivity,
      String? activityMessage,
      String? message});
}

/// @nodoc
class __$$AppHealthStatusImplCopyWithImpl<$Res>
    extends _$AppHealthStatusCopyWithImpl<$Res, _$AppHealthStatusImpl>
    implements _$$AppHealthStatusImplCopyWith<$Res> {
  __$$AppHealthStatusImplCopyWithImpl(
      _$AppHealthStatusImpl _value, $Res Function(_$AppHealthStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppHealthStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checked = null,
    Object? systemHealth = null,
    Object? systemActivity = null,
    Object? activityMessage = freezed,
    Object? message = freezed,
  }) {
    return _then(_$AppHealthStatusImpl(
      checked: null == checked
          ? _value.checked
          : checked // ignore: cast_nullable_to_non_nullable
              as bool,
      systemHealth: null == systemHealth
          ? _value.systemHealth
          : systemHealth // ignore: cast_nullable_to_non_nullable
              as bool,
      systemActivity: null == systemActivity
          ? _value.systemActivity
          : systemActivity // ignore: cast_nullable_to_non_nullable
              as bool,
      activityMessage: freezed == activityMessage
          ? _value.activityMessage
          : activityMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppHealthStatusImpl implements _AppHealthStatus {
  const _$AppHealthStatusImpl(
      {required this.checked,
      required this.systemHealth,
      required this.systemActivity,
      this.activityMessage,
      this.message});

  factory _$AppHealthStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppHealthStatusImplFromJson(json);

  @override
  final bool checked;
  @override
  final bool systemHealth;
  @override
  final bool systemActivity;
  @override
  final String? activityMessage;
  @override
  final String? message;

  @override
  String toString() {
    return 'AppHealthStatus(checked: $checked, systemHealth: $systemHealth, systemActivity: $systemActivity, activityMessage: $activityMessage, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppHealthStatusImpl &&
            (identical(other.checked, checked) || other.checked == checked) &&
            (identical(other.systemHealth, systemHealth) ||
                other.systemHealth == systemHealth) &&
            (identical(other.systemActivity, systemActivity) ||
                other.systemActivity == systemActivity) &&
            (identical(other.activityMessage, activityMessage) ||
                other.activityMessage == activityMessage) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, checked, systemHealth,
      systemActivity, activityMessage, message);

  /// Create a copy of AppHealthStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppHealthStatusImplCopyWith<_$AppHealthStatusImpl> get copyWith =>
      __$$AppHealthStatusImplCopyWithImpl<_$AppHealthStatusImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppHealthStatusImplToJson(
      this,
    );
  }
}

abstract class _AppHealthStatus implements AppHealthStatus {
  const factory _AppHealthStatus(
      {required final bool checked,
      required final bool systemHealth,
      required final bool systemActivity,
      final String? activityMessage,
      final String? message}) = _$AppHealthStatusImpl;

  factory _AppHealthStatus.fromJson(Map<String, dynamic> json) =
      _$AppHealthStatusImpl.fromJson;

  @override
  bool get checked;
  @override
  bool get systemHealth;
  @override
  bool get systemActivity;
  @override
  String? get activityMessage;
  @override
  String? get message;

  /// Create a copy of AppHealthStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppHealthStatusImplCopyWith<_$AppHealthStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
