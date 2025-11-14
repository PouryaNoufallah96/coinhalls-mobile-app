import 'package:coin_hall/core/blocs/fetch_list_base_cubit/fetch_list_base_cubit.dart';
import 'package:coin_hall/core/services/prediction_service/models.dart';
import 'package:coin_hall/core/services/prediction_service/prediction_service.dart';

class ExpiredHistoryCubit extends FetchListBaseCubit<PredictionHistory>
    with FetchMoreList {
  ExpiredHistoryCubit({
    required this.predictionService,
  });

  final PredictionService predictionService;

  @override
  Future<FetchListReponse<PredictionHistory>> fetcher() async {
    final items = await predictionService.getExpirePredict(1);

    return FetchListReponse(
      data: items.$1,
      totalCount: items.$2,
    );
  }

  @override
  Future<List<PredictionHistory>> moreFetcher(int page) async {
    return (await predictionService.getExpirePredict(page)).$1;
  }
}
