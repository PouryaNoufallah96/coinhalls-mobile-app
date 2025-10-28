// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rz_quantiy_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RzQuantiyEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RzQuantiyEventCopyWith<$Res> {
  factory $RzQuantiyEventCopyWith(
          RzQuantiyEvent value, $Res Function(RzQuantiyEvent) then) =
      _$RzQuantiyEventCopyWithImpl<$Res, RzQuantiyEvent>;
}

/// @nodoc
class _$RzQuantiyEventCopyWithImpl<$Res, $Val extends RzQuantiyEvent>
    implements $RzQuantiyEventCopyWith<$Res> {
  _$RzQuantiyEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RzQuantiyEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$RzQuantiyEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RzQuantiyEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'RzQuantiyEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements RzQuantiyEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
mixin _$RzQuantiyState {
  double get available => throw _privateConstructorUsedError;

  /// Create a copy of RzQuantiyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RzQuantiyStateCopyWith<RzQuantiyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RzQuantiyStateCopyWith<$Res> {
  factory $RzQuantiyStateCopyWith(
          RzQuantiyState value, $Res Function(RzQuantiyState) then) =
      _$RzQuantiyStateCopyWithImpl<$Res, RzQuantiyState>;
  @useResult
  $Res call({double available});
}

/// @nodoc
class _$RzQuantiyStateCopyWithImpl<$Res, $Val extends RzQuantiyState>
    implements $RzQuantiyStateCopyWith<$Res> {
  _$RzQuantiyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RzQuantiyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? available = null,
  }) {
    return _then(_value.copyWith(
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RzQuantiyStateImplCopyWith<$Res>
    implements $RzQuantiyStateCopyWith<$Res> {
  factory _$$RzQuantiyStateImplCopyWith(_$RzQuantiyStateImpl value,
          $Res Function(_$RzQuantiyStateImpl) then) =
      __$$RzQuantiyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double available});
}

/// @nodoc
class __$$RzQuantiyStateImplCopyWithImpl<$Res>
    extends _$RzQuantiyStateCopyWithImpl<$Res, _$RzQuantiyStateImpl>
    implements _$$RzQuantiyStateImplCopyWith<$Res> {
  __$$RzQuantiyStateImplCopyWithImpl(
      _$RzQuantiyStateImpl _value, $Res Function(_$RzQuantiyStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RzQuantiyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? available = null,
  }) {
    return _then(_$RzQuantiyStateImpl(
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$RzQuantiyStateImpl implements _RzQuantiyState {
  const _$RzQuantiyStateImpl({this.available = 0});

  @override
  @JsonKey()
  final double available;

  @override
  String toString() {
    return 'RzQuantiyState(available: $available)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RzQuantiyStateImpl &&
            (identical(other.available, available) ||
                other.available == available));
  }

  @override
  int get hashCode => Object.hash(runtimeType, available);

  /// Create a copy of RzQuantiyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RzQuantiyStateImplCopyWith<_$RzQuantiyStateImpl> get copyWith =>
      __$$RzQuantiyStateImplCopyWithImpl<_$RzQuantiyStateImpl>(
          this, _$identity);
}

abstract class _RzQuantiyState implements RzQuantiyState {
  const factory _RzQuantiyState({final double available}) =
      _$RzQuantiyStateImpl;

  @override
  double get available;

  /// Create a copy of RzQuantiyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RzQuantiyStateImplCopyWith<_$RzQuantiyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
