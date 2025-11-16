import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coin_hall/core/services/auth_interceptor/auth_interceptor.dart';
import 'package:coin_hall/core/services/stats_serivce/models.dart';
import 'package:coin_hall/core/services/stats_serivce/stats_serivce.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'user_stats_cubit.freezed.dart';
part 'user_stats_state.dart';

class UserStatsCubit extends Cubit<UserStatsState> {
  UserStatsCubit({
    required AuthInterceptor authInterceptor,
    required StatsService statsService,
  })  : _statsService = statsService,
        super(const UserStatsState.initial()) {
    _subscription = authInterceptor.stream
        .map((event) => event.token?.token)
        .distinctUnique(equals: (e1, e2) => e1 == e2)
        .listen((event) {
      if (event != null) {
        fetch();
      }
    });
  }

  final StatsService _statsService;
  late final StreamSubscription<String?> _subscription;

  @override
  Future<void> close() async {
    await super.close();
    await _subscription.cancel();
  }

  Future<void> fetch() async {
    emit(const UserStatsState.inProgress());
    final stats = await _statsService.fetch();

    if (stats != null) {
      emit(UserStatsState.success(stats: stats));

      return;
    }

    emit(const UserStatsState.failure());
  }
}
