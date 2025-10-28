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

NonceData _$NonceDataFromJson(Map<String, dynamic> json) {
  return _NonceData.fromJson(json);
}

/// @nodoc
mixin _$NonceData {
  String get nonce => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get expireMoment => throw _privateConstructorUsedError;

  /// Serializes this NonceData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NonceData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NonceDataCopyWith<NonceData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NonceDataCopyWith<$Res> {
  factory $NonceDataCopyWith(NonceData value, $Res Function(NonceData) then) =
      _$NonceDataCopyWithImpl<$Res, NonceData>;
  @useResult
  $Res call({String nonce, String message, String expireMoment});
}

/// @nodoc
class _$NonceDataCopyWithImpl<$Res, $Val extends NonceData>
    implements $NonceDataCopyWith<$Res> {
  _$NonceDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NonceData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nonce = null,
    Object? message = null,
    Object? expireMoment = null,
  }) {
    return _then(_value.copyWith(
      nonce: null == nonce
          ? _value.nonce
          : nonce // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      expireMoment: null == expireMoment
          ? _value.expireMoment
          : expireMoment // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NonceDataImplCopyWith<$Res>
    implements $NonceDataCopyWith<$Res> {
  factory _$$NonceDataImplCopyWith(
          _$NonceDataImpl value, $Res Function(_$NonceDataImpl) then) =
      __$$NonceDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String nonce, String message, String expireMoment});
}

/// @nodoc
class __$$NonceDataImplCopyWithImpl<$Res>
    extends _$NonceDataCopyWithImpl<$Res, _$NonceDataImpl>
    implements _$$NonceDataImplCopyWith<$Res> {
  __$$NonceDataImplCopyWithImpl(
      _$NonceDataImpl _value, $Res Function(_$NonceDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of NonceData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nonce = null,
    Object? message = null,
    Object? expireMoment = null,
  }) {
    return _then(_$NonceDataImpl(
      nonce: null == nonce
          ? _value.nonce
          : nonce // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      expireMoment: null == expireMoment
          ? _value.expireMoment
          : expireMoment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NonceDataImpl implements _NonceData {
  const _$NonceDataImpl(
      {required this.nonce, required this.message, required this.expireMoment});

  factory _$NonceDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$NonceDataImplFromJson(json);

  @override
  final String nonce;
  @override
  final String message;
  @override
  final String expireMoment;

  @override
  String toString() {
    return 'NonceData(nonce: $nonce, message: $message, expireMoment: $expireMoment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NonceDataImpl &&
            (identical(other.nonce, nonce) || other.nonce == nonce) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.expireMoment, expireMoment) ||
                other.expireMoment == expireMoment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nonce, message, expireMoment);

  /// Create a copy of NonceData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NonceDataImplCopyWith<_$NonceDataImpl> get copyWith =>
      __$$NonceDataImplCopyWithImpl<_$NonceDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NonceDataImplToJson(
      this,
    );
  }
}

abstract class _NonceData implements NonceData {
  const factory _NonceData(
      {required final String nonce,
      required final String message,
      required final String expireMoment}) = _$NonceDataImpl;

  factory _NonceData.fromJson(Map<String, dynamic> json) =
      _$NonceDataImpl.fromJson;

  @override
  String get nonce;
  @override
  String get message;
  @override
  String get expireMoment;

  /// Create a copy of NonceData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NonceDataImplCopyWith<_$NonceDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
