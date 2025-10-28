import 'package:coin_hall/core/services/http_service/http_service.dart';
import 'package:coin_hall/core/services/status_service/models.dart';

class StatusService {
  StatusService({
    required HttpService adapter,
  }) : _adapter = adapter;

  final HttpService _adapter;

  Future<AppHealthStatus?> fetch() async {
    final res = await _adapter
        .requestUri<Map<String, dynamic>>(Uri.parse('User/GetStatus'));

    return switch (res) {
      AppSuccessResponse(:final data) =>
        AppHealthStatus.fromJson(data!['data'] as Map<String, dynamic>),
      _ => null,
    };
  }
}
