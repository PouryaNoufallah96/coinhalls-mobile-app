part of 'price_bloc.dart';

@freezed
class PriceState with _$PriceState {
  const factory PriceState({
    @Default([]) List<TokenPrice> prices,
  }) = _PriceState;
}

@freezed
class TokenPrice with _$TokenPrice {
  const factory TokenPrice({
    required String tokenName,
    required double price,
  }) = _TokenPrice;

  factory TokenPrice.fromJson(Map<String, dynamic> json) =>
      _$TokenPriceFromJson(json);
}
