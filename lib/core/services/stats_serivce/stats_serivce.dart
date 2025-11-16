import 'package:coin_hall/core/services/http_service/http_service.dart';
import 'package:coin_hall/core/services/stats_serivce/models.dart';

class StatsService {
  StatsService({
    required HttpService adapter,
  }) : _adapter = adapter;

  final HttpService _adapter;

  Future<UserStats?> fetch() async {
    final res = await _adapter.requestUri<Map<String, dynamic>>(
        Uri.parse('User/GetUserStats'),
        withToast: false);

    return switch (res) {
      AppSuccessResponse(:final data) =>
        UserStats.fromJson(data!['data'] as Map<String, dynamic>),
      _ => null,
    };
  }
}
