import 'package:coin_hall/core/services/http_service/http_service.dart';
import 'package:coin_hall/core/services/prediction_service/models.dart';

class PredictionService {
  PredictionService({
    required HttpService adapter,
  }) : _adapter = adapter;

  final HttpService _adapter;

  Future<List<PredictionHistory>> addPrediction(
      String reference, List<double> amount) async {
    final res = await _adapter.requestUri<Map<String, dynamic>>(
      Uri.parse('Prediction/AddPrediction'),
      method: HttpMethod.post,
      body: {
        'gameReference': reference,
        'predictionsTokenAmount': [...amount]
      },
    );

    return res.parsedList(PredictionHistory.fromJson);
  }

  Future<(List<PredictionHistory> data, int totalCount)> getActivePredict(
    int page,
    String? symbol,
  ) async {
    return _getPredict(['Active'], page, 24, symbol);
  }

  Future<(List<PredictionHistory> data, int totalCount)> getExpirePredict(
    int page,
    String? symbol,
  ) async {
    return _getPredict(['Lose', 'Pending', 'Win'], page, 24, symbol);
  }

  Future<(List<PredictionHistory> data, int totalCount)> _getPredict(
    List<String> states,
    int page,
    int size,
    String? symbol,
  ) async {
    final res = await _adapter.requestUri<Map<String, dynamic>>(
      Uri.parse('Prediction/GetPredictionList'),
      method: HttpMethod.post,
      body: {
        'pagination': {'page': page, 'size': size},
        'stateFilter': [...states],
        if (symbol != null) 'tokenFilters': [symbol],
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
