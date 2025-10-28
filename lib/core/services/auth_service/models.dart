import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class NonceData with _$NonceData {
  const factory NonceData({
    required String nonce,
    required String message,
    required String expireMoment,
  }) = _NonceData;

  factory NonceData.fromJson(Map<String, dynamic> json) =>
      _$NonceDataFromJson(json);
}

extension NonceDataX on NonceData {
  bool get isNonceValid {
    final expireAt = DateTime.tryParse(expireMoment)?.toLocal() ??
        DateTime.now().add(const Duration(minutes: 5));

    return DateTime.now().isBefore(expireAt);
  }
}
