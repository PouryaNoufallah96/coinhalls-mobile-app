part of 'user_stats_cubit.dart';

@freezed
class UserStatsState with _$UserStatsState {
  const factory UserStatsState.initial() = _Initial;
  const factory UserStatsState.inProgress() = _inProgress;
  const factory UserStatsState.success({
    required UserStats stats,
  }) = _success;
  const factory UserStatsState.failure() = _failure;
}
