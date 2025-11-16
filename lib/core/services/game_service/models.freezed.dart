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

GameCategory _$GameCategoryFromJson(Map<String, dynamic> json) {
  return _GameCategory.fromJson(json);
}

/// @nodoc
mixin _$GameCategory {
  int get activeGameCounts => throw _privateConstructorUsedError;
  String? get tokenAddress => throw _privateConstructorUsedError;
  String? get tokenSymbol => throw _privateConstructorUsedError;
  String? get tokenName => throw _privateConstructorUsedError;

  /// Serializes this GameCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameCategoryCopyWith<GameCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameCategoryCopyWith<$Res> {
  factory $GameCategoryCopyWith(
          GameCategory value, $Res Function(GameCategory) then) =
      _$GameCategoryCopyWithImpl<$Res, GameCategory>;
  @useResult
  $Res call(
      {int activeGameCounts,
      String? tokenAddress,
      String? tokenSymbol,
      String? tokenName});
}

/// @nodoc
class _$GameCategoryCopyWithImpl<$Res, $Val extends GameCategory>
    implements $GameCategoryCopyWith<$Res> {
  _$GameCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeGameCounts = null,
    Object? tokenAddress = freezed,
    Object? tokenSymbol = freezed,
    Object? tokenName = freezed,
  }) {
    return _then(_value.copyWith(
      activeGameCounts: null == activeGameCounts
          ? _value.activeGameCounts
          : activeGameCounts // ignore: cast_nullable_to_non_nullable
              as int,
      tokenAddress: freezed == tokenAddress
          ? _value.tokenAddress
          : tokenAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenSymbol: freezed == tokenSymbol
          ? _value.tokenSymbol
          : tokenSymbol // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenName: freezed == tokenName
          ? _value.tokenName
          : tokenName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameCategoryImplCopyWith<$Res>
    implements $GameCategoryCopyWith<$Res> {
  factory _$$GameCategoryImplCopyWith(
          _$GameCategoryImpl value, $Res Function(_$GameCategoryImpl) then) =
      __$$GameCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int activeGameCounts,
      String? tokenAddress,
      String? tokenSymbol,
      String? tokenName});
}

/// @nodoc
class __$$GameCategoryImplCopyWithImpl<$Res>
    extends _$GameCategoryCopyWithImpl<$Res, _$GameCategoryImpl>
    implements _$$GameCategoryImplCopyWith<$Res> {
  __$$GameCategoryImplCopyWithImpl(
      _$GameCategoryImpl _value, $Res Function(_$GameCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeGameCounts = null,
    Object? tokenAddress = freezed,
    Object? tokenSymbol = freezed,
    Object? tokenName = freezed,
  }) {
    return _then(_$GameCategoryImpl(
      activeGameCounts: null == activeGameCounts
          ? _value.activeGameCounts
          : activeGameCounts // ignore: cast_nullable_to_non_nullable
              as int,
      tokenAddress: freezed == tokenAddress
          ? _value.tokenAddress
          : tokenAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenSymbol: freezed == tokenSymbol
          ? _value.tokenSymbol
          : tokenSymbol // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenName: freezed == tokenName
          ? _value.tokenName
          : tokenName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameCategoryImpl implements _GameCategory {
  const _$GameCategoryImpl(
      {required this.activeGameCounts,
      this.tokenAddress,
      this.tokenSymbol,
      this.tokenName});

  factory _$GameCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameCategoryImplFromJson(json);

  @override
  final int activeGameCounts;
  @override
  final String? tokenAddress;
  @override
  final String? tokenSymbol;
  @override
  final String? tokenName;

  @override
  String toString() {
    return 'GameCategory(activeGameCounts: $activeGameCounts, tokenAddress: $tokenAddress, tokenSymbol: $tokenSymbol, tokenName: $tokenName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameCategoryImpl &&
            (identical(other.activeGameCounts, activeGameCounts) ||
                other.activeGameCounts == activeGameCounts) &&
            (identical(other.tokenAddress, tokenAddress) ||
                other.tokenAddress == tokenAddress) &&
            (identical(other.tokenSymbol, tokenSymbol) ||
                other.tokenSymbol == tokenSymbol) &&
            (identical(other.tokenName, tokenName) ||
                other.tokenName == tokenName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, activeGameCounts, tokenAddress, tokenSymbol, tokenName);

  /// Create a copy of GameCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameCategoryImplCopyWith<_$GameCategoryImpl> get copyWith =>
      __$$GameCategoryImplCopyWithImpl<_$GameCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameCategoryImplToJson(
      this,
    );
  }
}

abstract class _GameCategory implements GameCategory {
  const factory _GameCategory(
      {required final int activeGameCounts,
      final String? tokenAddress,
      final String? tokenSymbol,
      final String? tokenName}) = _$GameCategoryImpl;

  factory _GameCategory.fromJson(Map<String, dynamic> json) =
      _$GameCategoryImpl.fromJson;

  @override
  int get activeGameCounts;
  @override
  String? get tokenAddress;
  @override
  String? get tokenSymbol;
  @override
  String? get tokenName;

  /// Create a copy of GameCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameCategoryImplCopyWith<_$GameCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GameData _$GameDataFromJson(Map<String, dynamic> json) {
  return _GameData.fromJson(json);
}

/// @nodoc
mixin _$GameData {
  GameDataState get state => throw _privateConstructorUsedError;
  double get prizeValue => throw _privateConstructorUsedError;
  double get targetValue => throw _privateConstructorUsedError;
  String get tokenSymbol => throw _privateConstructorUsedError;
  String get tokenName => throw _privateConstructorUsedError;
  String get gameName => throw _privateConstructorUsedError;
  String get startTime => throw _privateConstructorUsedError;
  String get stopTime => throw _privateConstructorUsedError;
  String get endTime => throw _privateConstructorUsedError;
  String get attachmentUrl => throw _privateConstructorUsedError;
  String get gameReference => throw _privateConstructorUsedError;
  String? get tokenAddress => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;

  /// Serializes this GameData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameDataCopyWith<GameData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameDataCopyWith<$Res> {
  factory $GameDataCopyWith(GameData value, $Res Function(GameData) then) =
      _$GameDataCopyWithImpl<$Res, GameData>;
  @useResult
  $Res call(
      {GameDataState state,
      double prizeValue,
      double targetValue,
      String tokenSymbol,
      String tokenName,
      String gameName,
      String startTime,
      String stopTime,
      String endTime,
      String attachmentUrl,
      String gameReference,
      String? tokenAddress,
      String? description,
      String? title});
}

/// @nodoc
class _$GameDataCopyWithImpl<$Res, $Val extends GameData>
    implements $GameDataCopyWith<$Res> {
  _$GameDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? prizeValue = null,
    Object? targetValue = null,
    Object? tokenSymbol = null,
    Object? tokenName = null,
    Object? gameName = null,
    Object? startTime = null,
    Object? stopTime = null,
    Object? endTime = null,
    Object? attachmentUrl = null,
    Object? gameReference = null,
    Object? tokenAddress = freezed,
    Object? description = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as GameDataState,
      prizeValue: null == prizeValue
          ? _value.prizeValue
          : prizeValue // ignore: cast_nullable_to_non_nullable
              as double,
      targetValue: null == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as double,
      tokenSymbol: null == tokenSymbol
          ? _value.tokenSymbol
          : tokenSymbol // ignore: cast_nullable_to_non_nullable
              as String,
      tokenName: null == tokenName
          ? _value.tokenName
          : tokenName // ignore: cast_nullable_to_non_nullable
              as String,
      gameName: null == gameName
          ? _value.gameName
          : gameName // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      stopTime: null == stopTime
          ? _value.stopTime
          : stopTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      attachmentUrl: null == attachmentUrl
          ? _value.attachmentUrl
          : attachmentUrl // ignore: cast_nullable_to_non_nullable
              as String,
      gameReference: null == gameReference
          ? _value.gameReference
          : gameReference // ignore: cast_nullable_to_non_nullable
              as String,
      tokenAddress: freezed == tokenAddress
          ? _value.tokenAddress
          : tokenAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameDataImplCopyWith<$Res>
    implements $GameDataCopyWith<$Res> {
  factory _$$GameDataImplCopyWith(
          _$GameDataImpl value, $Res Function(_$GameDataImpl) then) =
      __$$GameDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GameDataState state,
      double prizeValue,
      double targetValue,
      String tokenSymbol,
      String tokenName,
      String gameName,
      String startTime,
      String stopTime,
      String endTime,
      String attachmentUrl,
      String gameReference,
      String? tokenAddress,
      String? description,
      String? title});
}

/// @nodoc
class __$$GameDataImplCopyWithImpl<$Res>
    extends _$GameDataCopyWithImpl<$Res, _$GameDataImpl>
    implements _$$GameDataImplCopyWith<$Res> {
  __$$GameDataImplCopyWithImpl(
      _$GameDataImpl _value, $Res Function(_$GameDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of GameData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? prizeValue = null,
    Object? targetValue = null,
    Object? tokenSymbol = null,
    Object? tokenName = null,
    Object? gameName = null,
    Object? startTime = null,
    Object? stopTime = null,
    Object? endTime = null,
    Object? attachmentUrl = null,
    Object? gameReference = null,
    Object? tokenAddress = freezed,
    Object? description = freezed,
    Object? title = freezed,
  }) {
    return _then(_$GameDataImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as GameDataState,
      prizeValue: null == prizeValue
          ? _value.prizeValue
          : prizeValue // ignore: cast_nullable_to_non_nullable
              as double,
      targetValue: null == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as double,
      tokenSymbol: null == tokenSymbol
          ? _value.tokenSymbol
          : tokenSymbol // ignore: cast_nullable_to_non_nullable
              as String,
      tokenName: null == tokenName
          ? _value.tokenName
          : tokenName // ignore: cast_nullable_to_non_nullable
              as String,
      gameName: null == gameName
          ? _value.gameName
          : gameName // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      stopTime: null == stopTime
          ? _value.stopTime
          : stopTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      attachmentUrl: null == attachmentUrl
          ? _value.attachmentUrl
          : attachmentUrl // ignore: cast_nullable_to_non_nullable
              as String,
      gameReference: null == gameReference
          ? _value.gameReference
          : gameReference // ignore: cast_nullable_to_non_nullable
              as String,
      tokenAddress: freezed == tokenAddress
          ? _value.tokenAddress
          : tokenAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameDataImpl implements _GameData {
  const _$GameDataImpl(
      {required this.state,
      required this.prizeValue,
      required this.targetValue,
      required this.tokenSymbol,
      required this.tokenName,
      required this.gameName,
      required this.startTime,
      required this.stopTime,
      required this.endTime,
      required this.attachmentUrl,
      required this.gameReference,
      this.tokenAddress,
      this.description,
      this.title});

  factory _$GameDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameDataImplFromJson(json);

  @override
  final GameDataState state;
  @override
  final double prizeValue;
  @override
  final double targetValue;
  @override
  final String tokenSymbol;
  @override
  final String tokenName;
  @override
  final String gameName;
  @override
  final String startTime;
  @override
  final String stopTime;
  @override
  final String endTime;
  @override
  final String attachmentUrl;
  @override
  final String gameReference;
  @override
  final String? tokenAddress;
  @override
  final String? description;
  @override
  final String? title;

  @override
  String toString() {
    return 'GameData(state: $state, prizeValue: $prizeValue, targetValue: $targetValue, tokenSymbol: $tokenSymbol, tokenName: $tokenName, gameName: $gameName, startTime: $startTime, stopTime: $stopTime, endTime: $endTime, attachmentUrl: $attachmentUrl, gameReference: $gameReference, tokenAddress: $tokenAddress, description: $description, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameDataImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.prizeValue, prizeValue) ||
                other.prizeValue == prizeValue) &&
            (identical(other.targetValue, targetValue) ||
                other.targetValue == targetValue) &&
            (identical(other.tokenSymbol, tokenSymbol) ||
                other.tokenSymbol == tokenSymbol) &&
            (identical(other.tokenName, tokenName) ||
                other.tokenName == tokenName) &&
            (identical(other.gameName, gameName) ||
                other.gameName == gameName) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.stopTime, stopTime) ||
                other.stopTime == stopTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.attachmentUrl, attachmentUrl) ||
                other.attachmentUrl == attachmentUrl) &&
            (identical(other.gameReference, gameReference) ||
                other.gameReference == gameReference) &&
            (identical(other.tokenAddress, tokenAddress) ||
                other.tokenAddress == tokenAddress) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      state,
      prizeValue,
      targetValue,
      tokenSymbol,
      tokenName,
      gameName,
      startTime,
      stopTime,
      endTime,
      attachmentUrl,
      gameReference,
      tokenAddress,
      description,
      title);

  /// Create a copy of GameData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameDataImplCopyWith<_$GameDataImpl> get copyWith =>
      __$$GameDataImplCopyWithImpl<_$GameDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameDataImplToJson(
      this,
    );
  }
}

abstract class _GameData implements GameData {
  const factory _GameData(
      {required final GameDataState state,
      required final double prizeValue,
      required final double targetValue,
      required final String tokenSymbol,
      required final String tokenName,
      required final String gameName,
      required final String startTime,
      required final String stopTime,
      required final String endTime,
      required final String attachmentUrl,
      required final String gameReference,
      final String? tokenAddress,
      final String? description,
      final String? title}) = _$GameDataImpl;

  factory _GameData.fromJson(Map<String, dynamic> json) =
      _$GameDataImpl.fromJson;

  @override
  GameDataState get state;
  @override
  double get prizeValue;
  @override
  double get targetValue;
  @override
  String get tokenSymbol;
  @override
  String get tokenName;
  @override
  String get gameName;
  @override
  String get startTime;
  @override
  String get stopTime;
  @override
  String get endTime;
  @override
  String get attachmentUrl;
  @override
  String get gameReference;
  @override
  String? get tokenAddress;
  @override
  String? get description;
  @override
  String? get title;

  /// Create a copy of GameData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameDataImplCopyWith<_$GameDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
