// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PriceEvent {
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
abstract class $PriceEventCopyWith<$Res> {
  factory $PriceEventCopyWith(
          PriceEvent value, $Res Function(PriceEvent) then) =
      _$PriceEventCopyWithImpl<$Res, PriceEvent>;
}

/// @nodoc
class _$PriceEventCopyWithImpl<$Res, $Val extends PriceEvent>
    implements $PriceEventCopyWith<$Res> {
  _$PriceEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PriceEvent
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
    extends _$PriceEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PriceEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'PriceEvent.started()';
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

abstract class _Started implements PriceEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
mixin _$PriceState {
  List<TokenPrice> get prices => throw _privateConstructorUsedError;

  /// Create a copy of PriceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PriceStateCopyWith<PriceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceStateCopyWith<$Res> {
  factory $PriceStateCopyWith(
          PriceState value, $Res Function(PriceState) then) =
      _$PriceStateCopyWithImpl<$Res, PriceState>;
  @useResult
  $Res call({List<TokenPrice> prices});
}

/// @nodoc
class _$PriceStateCopyWithImpl<$Res, $Val extends PriceState>
    implements $PriceStateCopyWith<$Res> {
  _$PriceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PriceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prices = null,
  }) {
    return _then(_value.copyWith(
      prices: null == prices
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as List<TokenPrice>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceStateImplCopyWith<$Res>
    implements $PriceStateCopyWith<$Res> {
  factory _$$PriceStateImplCopyWith(
          _$PriceStateImpl value, $Res Function(_$PriceStateImpl) then) =
      __$$PriceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TokenPrice> prices});
}

/// @nodoc
class __$$PriceStateImplCopyWithImpl<$Res>
    extends _$PriceStateCopyWithImpl<$Res, _$PriceStateImpl>
    implements _$$PriceStateImplCopyWith<$Res> {
  __$$PriceStateImplCopyWithImpl(
      _$PriceStateImpl _value, $Res Function(_$PriceStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PriceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prices = null,
  }) {
    return _then(_$PriceStateImpl(
      prices: null == prices
          ? _value._prices
          : prices // ignore: cast_nullable_to_non_nullable
              as List<TokenPrice>,
    ));
  }
}

/// @nodoc

class _$PriceStateImpl implements _PriceState {
  const _$PriceStateImpl({final List<TokenPrice> prices = const []})
      : _prices = prices;

  final List<TokenPrice> _prices;
  @override
  @JsonKey()
  List<TokenPrice> get prices {
    if (_prices is EqualUnmodifiableListView) return _prices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_prices);
  }

  @override
  String toString() {
    return 'PriceState(prices: $prices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceStateImpl &&
            const DeepCollectionEquality().equals(other._prices, _prices));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_prices));

  /// Create a copy of PriceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceStateImplCopyWith<_$PriceStateImpl> get copyWith =>
      __$$PriceStateImplCopyWithImpl<_$PriceStateImpl>(this, _$identity);
}

abstract class _PriceState implements PriceState {
  const factory _PriceState({final List<TokenPrice> prices}) = _$PriceStateImpl;

  @override
  List<TokenPrice> get prices;

  /// Create a copy of PriceState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PriceStateImplCopyWith<_$PriceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TokenPrice _$TokenPriceFromJson(Map<String, dynamic> json) {
  return _TokenPrice.fromJson(json);
}

/// @nodoc
mixin _$TokenPrice {
  String get tokenName => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  /// Serializes this TokenPrice to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TokenPrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenPriceCopyWith<TokenPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenPriceCopyWith<$Res> {
  factory $TokenPriceCopyWith(
          TokenPrice value, $Res Function(TokenPrice) then) =
      _$TokenPriceCopyWithImpl<$Res, TokenPrice>;
  @useResult
  $Res call({String tokenName, double price});
}

/// @nodoc
class _$TokenPriceCopyWithImpl<$Res, $Val extends TokenPrice>
    implements $TokenPriceCopyWith<$Res> {
  _$TokenPriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TokenPrice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tokenName = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      tokenName: null == tokenName
          ? _value.tokenName
          : tokenName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenPriceImplCopyWith<$Res>
    implements $TokenPriceCopyWith<$Res> {
  factory _$$TokenPriceImplCopyWith(
          _$TokenPriceImpl value, $Res Function(_$TokenPriceImpl) then) =
      __$$TokenPriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String tokenName, double price});
}

/// @nodoc
class __$$TokenPriceImplCopyWithImpl<$Res>
    extends _$TokenPriceCopyWithImpl<$Res, _$TokenPriceImpl>
    implements _$$TokenPriceImplCopyWith<$Res> {
  __$$TokenPriceImplCopyWithImpl(
      _$TokenPriceImpl _value, $Res Function(_$TokenPriceImpl) _then)
      : super(_value, _then);

  /// Create a copy of TokenPrice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tokenName = null,
    Object? price = null,
  }) {
    return _then(_$TokenPriceImpl(
      tokenName: null == tokenName
          ? _value.tokenName
          : tokenName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenPriceImpl implements _TokenPrice {
  const _$TokenPriceImpl({required this.tokenName, required this.price});

  factory _$TokenPriceImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenPriceImplFromJson(json);

  @override
  final String tokenName;
  @override
  final double price;

  @override
  String toString() {
    return 'TokenPrice(tokenName: $tokenName, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenPriceImpl &&
            (identical(other.tokenName, tokenName) ||
                other.tokenName == tokenName) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tokenName, price);

  /// Create a copy of TokenPrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenPriceImplCopyWith<_$TokenPriceImpl> get copyWith =>
      __$$TokenPriceImplCopyWithImpl<_$TokenPriceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenPriceImplToJson(
      this,
    );
  }
}

abstract class _TokenPrice implements TokenPrice {
  const factory _TokenPrice(
      {required final String tokenName,
      required final double price}) = _$TokenPriceImpl;

  factory _TokenPrice.fromJson(Map<String, dynamic> json) =
      _$TokenPriceImpl.fromJson;

  @override
  String get tokenName;
  @override
  double get price;

  /// Create a copy of TokenPrice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenPriceImplCopyWith<_$TokenPriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
