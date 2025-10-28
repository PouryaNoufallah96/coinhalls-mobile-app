import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class UserStats with _$UserStats {
  const factory UserStats({
    required String userStatus,
  }) = _UserStats;

  factory UserStats.fromJson(Map<String, dynamic> json) =>
      _$UserStatsFromJson(json);
}

extension UserStatsX on UserStats {
  bool get isActive => userStatus == 'Active';
}
