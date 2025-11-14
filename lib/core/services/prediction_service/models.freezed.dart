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

PredictionHistory _$PredictionHistoryFromJson(Map<String, dynamic> json) {
  return _PredictionHistory.fromJson(json);
}

/// @nodoc
mixin _$PredictionHistory {
  String get createMoment => throw _privateConstructorUsedError;
  String get gameName => throw _privateConstructorUsedError;
  String get gameEndMoment => throw _privateConstructorUsedError;
  String get gameStopMoment => throw _privateConstructorUsedError;
  String get tokenSymbol => throw _privateConstructorUsedError;
  String get tokenName => throw _privateConstructorUsedError;
  double get predictionTokenAmount => throw _privateConstructorUsedError;
  PredictionState get state => throw _privateConstructorUsedError;
  bool get canEdit => throw _privateConstructorUsedError;

  /// Serializes this PredictionHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PredictionHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PredictionHistoryCopyWith<PredictionHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PredictionHistoryCopyWith<$Res> {
  factory $PredictionHistoryCopyWith(
          PredictionHistory value, $Res Function(PredictionHistory) then) =
      _$PredictionHistoryCopyWithImpl<$Res, PredictionHistory>;
  @useResult
  $Res call(
      {String createMoment,
      String gameName,
      String gameEndMoment,
      String gameStopMoment,
      String tokenSymbol,
      String tokenName,
      double predictionTokenAmount,
      PredictionState state,
      bool canEdit});
}

/// @nodoc
class _$PredictionHistoryCopyWithImpl<$Res, $Val extends PredictionHistory>
    implements $PredictionHistoryCopyWith<$Res> {
  _$PredictionHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PredictionHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createMoment = null,
    Object? gameName = null,
    Object? gameEndMoment = null,
    Object? gameStopMoment = null,
    Object? tokenSymbol = null,
    Object? tokenName = null,
    Object? predictionTokenAmount = null,
    Object? state = null,
    Object? canEdit = null,
  }) {
    return _then(_value.copyWith(
      createMoment: null == createMoment
          ? _value.createMoment
          : createMoment // ignore: cast_nullable_to_non_nullable
              as String,
      gameName: null == gameName
          ? _value.gameName
          : gameName // ignore: cast_nullable_to_non_nullable
              as String,
      gameEndMoment: null == gameEndMoment
          ? _value.gameEndMoment
          : gameEndMoment // ignore: cast_nullable_to_non_nullable
              as String,
      gameStopMoment: null == gameStopMoment
          ? _value.gameStopMoment
          : gameStopMoment // ignore: cast_nullable_to_non_nullable
              as String,
      tokenSymbol: null == tokenSymbol
          ? _value.tokenSymbol
          : tokenSymbol // ignore: cast_nullable_to_non_nullable
              as String,
      tokenName: null == tokenName
          ? _value.tokenName
          : tokenName // ignore: cast_nullable_to_non_nullable
              as String,
      predictionTokenAmount: null == predictionTokenAmount
          ? _value.predictionTokenAmount
          : predictionTokenAmount // ignore: cast_nullable_to_non_nullable
              as double,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as PredictionState,
      canEdit: null == canEdit
          ? _value.canEdit
          : canEdit // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PredictionHistoryImplCopyWith<$Res>
    implements $PredictionHistoryCopyWith<$Res> {
  factory _$$PredictionHistoryImplCopyWith(_$PredictionHistoryImpl value,
          $Res Function(_$PredictionHistoryImpl) then) =
      __$$PredictionHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String createMoment,
      String gameName,
      String gameEndMoment,
      String gameStopMoment,
      String tokenSymbol,
      String tokenName,
      double predictionTokenAmount,
      PredictionState state,
      bool canEdit});
}

/// @nodoc
class __$$PredictionHistoryImplCopyWithImpl<$Res>
    extends _$PredictionHistoryCopyWithImpl<$Res, _$PredictionHistoryImpl>
    implements _$$PredictionHistoryImplCopyWith<$Res> {
  __$$PredictionHistoryImplCopyWithImpl(_$PredictionHistoryImpl _value,
      $Res Function(_$PredictionHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of PredictionHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createMoment = null,
    Object? gameName = null,
    Object? gameEndMoment = null,
    Object? gameStopMoment = null,
    Object? tokenSymbol = null,
    Object? tokenName = null,
    Object? predictionTokenAmount = null,
    Object? state = null,
    Object? canEdit = null,
  }) {
    return _then(_$PredictionHistoryImpl(
      createMoment: null == createMoment
          ? _value.createMoment
          : createMoment // ignore: cast_nullable_to_non_nullable
              as String,
      gameName: null == gameName
          ? _value.gameName
          : gameName // ignore: cast_nullable_to_non_nullable
              as String,
      gameEndMoment: null == gameEndMoment
          ? _value.gameEndMoment
          : gameEndMoment // ignore: cast_nullable_to_non_nullable
              as String,
      gameStopMoment: null == gameStopMoment
          ? _value.gameStopMoment
          : gameStopMoment // ignore: cast_nullable_to_non_nullable
              as String,
      tokenSymbol: null == tokenSymbol
          ? _value.tokenSymbol
          : tokenSymbol // ignore: cast_nullable_to_non_nullable
              as String,
      tokenName: null == tokenName
          ? _value.tokenName
          : tokenName // ignore: cast_nullable_to_non_nullable
              as String,
      predictionTokenAmount: null == predictionTokenAmount
          ? _value.predictionTokenAmount
          : predictionTokenAmount // ignore: cast_nullable_to_non_nullable
              as double,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as PredictionState,
      canEdit: null == canEdit
          ? _value.canEdit
          : canEdit // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PredictionHistoryImpl implements _PredictionHistory {
  const _$PredictionHistoryImpl(
      {required this.createMoment,
      required this.gameName,
      required this.gameEndMoment,
      required this.gameStopMoment,
      required this.tokenSymbol,
      required this.tokenName,
      required this.predictionTokenAmount,
      required this.state,
      required this.canEdit});

  factory _$PredictionHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PredictionHistoryImplFromJson(json);

  @override
  final String createMoment;
  @override
  final String gameName;
  @override
  final String gameEndMoment;
  @override
  final String gameStopMoment;
  @override
  final String tokenSymbol;
  @override
  final String tokenName;
  @override
  final double predictionTokenAmount;
  @override
  final PredictionState state;
  @override
  final bool canEdit;

  @override
  String toString() {
    return 'PredictionHistory(createMoment: $createMoment, gameName: $gameName, gameEndMoment: $gameEndMoment, gameStopMoment: $gameStopMoment, tokenSymbol: $tokenSymbol, tokenName: $tokenName, predictionTokenAmount: $predictionTokenAmount, state: $state, canEdit: $canEdit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PredictionHistoryImpl &&
            (identical(other.createMoment, createMoment) ||
                other.createMoment == createMoment) &&
            (identical(other.gameName, gameName) ||
                other.gameName == gameName) &&
            (identical(other.gameEndMoment, gameEndMoment) ||
                other.gameEndMoment == gameEndMoment) &&
            (identical(other.gameStopMoment, gameStopMoment) ||
                other.gameStopMoment == gameStopMoment) &&
            (identical(other.tokenSymbol, tokenSymbol) ||
                other.tokenSymbol == tokenSymbol) &&
            (identical(other.tokenName, tokenName) ||
                other.tokenName == tokenName) &&
            (identical(other.predictionTokenAmount, predictionTokenAmount) ||
                other.predictionTokenAmount == predictionTokenAmount) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.canEdit, canEdit) || other.canEdit == canEdit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      createMoment,
      gameName,
      gameEndMoment,
      gameStopMoment,
      tokenSymbol,
      tokenName,
      predictionTokenAmount,
      state,
      canEdit);

  /// Create a copy of PredictionHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PredictionHistoryImplCopyWith<_$PredictionHistoryImpl> get copyWith =>
      __$$PredictionHistoryImplCopyWithImpl<_$PredictionHistoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PredictionHistoryImplToJson(
      this,
    );
  }
}

abstract class _PredictionHistory implements PredictionHistory {
  const factory _PredictionHistory(
      {required final String createMoment,
      required final String gameName,
      required final String gameEndMoment,
      required final String gameStopMoment,
      required final String tokenSymbol,
      required final String tokenName,
      required final double predictionTokenAmount,
      required final PredictionState state,
      required final bool canEdit}) = _$PredictionHistoryImpl;

  factory _PredictionHistory.fromJson(Map<String, dynamic> json) =
      _$PredictionHistoryImpl.fromJson;

  @override
  String get createMoment;
  @override
  String get gameName;
  @override
  String get gameEndMoment;
  @override
  String get gameStopMoment;
  @override
  String get tokenSymbol;
  @override
  String get tokenName;
  @override
  double get predictionTokenAmount;
  @override
  PredictionState get state;
  @override
  bool get canEdit;

  /// Create a copy of PredictionHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PredictionHistoryImplCopyWith<_$PredictionHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
