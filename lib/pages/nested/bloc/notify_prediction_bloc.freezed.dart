// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notify_prediction_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotifyPredictionEvent {
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
abstract class $NotifyPredictionEventCopyWith<$Res> {
  factory $NotifyPredictionEventCopyWith(NotifyPredictionEvent value,
          $Res Function(NotifyPredictionEvent) then) =
      _$NotifyPredictionEventCopyWithImpl<$Res, NotifyPredictionEvent>;
}

/// @nodoc
class _$NotifyPredictionEventCopyWithImpl<$Res,
        $Val extends NotifyPredictionEvent>
    implements $NotifyPredictionEventCopyWith<$Res> {
  _$NotifyPredictionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotifyPredictionEvent
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
    extends _$NotifyPredictionEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotifyPredictionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'NotifyPredictionEvent.started()';
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

abstract class _Started implements NotifyPredictionEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
mixin _$NotifyPredictionState {
  int? get lastUpdateTime => throw _privateConstructorUsedError;

  /// Create a copy of NotifyPredictionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotifyPredictionStateCopyWith<NotifyPredictionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotifyPredictionStateCopyWith<$Res> {
  factory $NotifyPredictionStateCopyWith(NotifyPredictionState value,
          $Res Function(NotifyPredictionState) then) =
      _$NotifyPredictionStateCopyWithImpl<$Res, NotifyPredictionState>;
  @useResult
  $Res call({int? lastUpdateTime});
}

/// @nodoc
class _$NotifyPredictionStateCopyWithImpl<$Res,
        $Val extends NotifyPredictionState>
    implements $NotifyPredictionStateCopyWith<$Res> {
  _$NotifyPredictionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotifyPredictionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastUpdateTime = freezed,
  }) {
    return _then(_value.copyWith(
      lastUpdateTime: freezed == lastUpdateTime
          ? _value.lastUpdateTime
          : lastUpdateTime // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotifyPredictionStateImplCopyWith<$Res>
    implements $NotifyPredictionStateCopyWith<$Res> {
  factory _$$NotifyPredictionStateImplCopyWith(
          _$NotifyPredictionStateImpl value,
          $Res Function(_$NotifyPredictionStateImpl) then) =
      __$$NotifyPredictionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? lastUpdateTime});
}

/// @nodoc
class __$$NotifyPredictionStateImplCopyWithImpl<$Res>
    extends _$NotifyPredictionStateCopyWithImpl<$Res,
        _$NotifyPredictionStateImpl>
    implements _$$NotifyPredictionStateImplCopyWith<$Res> {
  __$$NotifyPredictionStateImplCopyWithImpl(_$NotifyPredictionStateImpl _value,
      $Res Function(_$NotifyPredictionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotifyPredictionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastUpdateTime = freezed,
  }) {
    return _then(_$NotifyPredictionStateImpl(
      lastUpdateTime: freezed == lastUpdateTime
          ? _value.lastUpdateTime
          : lastUpdateTime // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$NotifyPredictionStateImpl implements _NotifyPredictionState {
  const _$NotifyPredictionStateImpl({this.lastUpdateTime});

  @override
  final int? lastUpdateTime;

  @override
  String toString() {
    return 'NotifyPredictionState(lastUpdateTime: $lastUpdateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotifyPredictionStateImpl &&
            (identical(other.lastUpdateTime, lastUpdateTime) ||
                other.lastUpdateTime == lastUpdateTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lastUpdateTime);

  /// Create a copy of NotifyPredictionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotifyPredictionStateImplCopyWith<_$NotifyPredictionStateImpl>
      get copyWith => __$$NotifyPredictionStateImplCopyWithImpl<
          _$NotifyPredictionStateImpl>(this, _$identity);
}

abstract class _NotifyPredictionState implements NotifyPredictionState {
  const factory _NotifyPredictionState({final int? lastUpdateTime}) =
      _$NotifyPredictionStateImpl;

  @override
  int? get lastUpdateTime;

  /// Create a copy of NotifyPredictionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotifyPredictionStateImplCopyWith<_$NotifyPredictionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
