import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.g.dart';
part 'models.freezed.dart';

@freezed
class AppHealthStatus with _$AppHealthStatus {
  const factory AppHealthStatus({
    required bool checked,
    required bool systemHealth,
    required bool systemActivity,
    String? activityMessage,
    String? message,
  }) = _AppHealthStatus;

  factory AppHealthStatus.fromJson(Map<String, dynamic> json) =>
      _$AppHealthStatusFromJson(json);
}
