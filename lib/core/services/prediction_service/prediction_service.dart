import 'package:coin_hall/core/services/http_service/http_service.dart';
import 'package:coin_hall/core/services/prediction_service/models.dart';

class PredictionService {
  PredictionService({
    required HttpService adapter,
  }) : _adapter = adapter;

  final HttpService _adapter;

  Future<(List<PredictionHistory> data, int totalCount)> getActivePredict(
    int page,
  ) async {
    return _getPredict(['Active'], page, 100);
  }

  Future<(List<PredictionHistory> data, int totalCount)> getExpirePredict(
    int page,
  ) async {
    return _getPredict(['Lose', 'Pending', 'Win'], page, 100);
  }

  Future<(List<PredictionHistory> data, int totalCount)> _getPredict(
    List<String> states,
    int page,
    int size,
  ) async {
    final res = await _adapter.requestUri<Map<String, dynamic>>(
      Uri.parse('Shield/GetAllShields'),
      method: HttpMethod.post,
      body: {
        'pagination': {'page': page, 'size': size},
        'stateFilter': [...states],
      },
    );

    return switch (res) {
      AppSuccessResponse(:final data) => (
          ((data!['data'] as Map<String, dynamic>)['data'] as List<dynamic>)
              .cast<Map<String, dynamic>>()
              .map(PredictionHistory.fromJson)
              .toList(),
          (data['data'] as Map<String, dynamic>)['totalCount'] as int
        ),
      _ => (<PredictionHistory>[], -1),
    };
  }
}
