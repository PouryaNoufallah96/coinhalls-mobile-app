import 'package:coin_hall/core/blocs/fetch_list_base_cubit/fetch_list_base_cubit.dart';
import 'package:coin_hall/core/services/game_service/game_service.dart';
import 'package:coin_hall/core/services/game_service/models.dart';

class CategoriesCubit extends FetchListBaseCubit<GameCategory> {
  CategoriesCubit({
    required GameService gameService,
  }) : _gameService = gameService;

  final GameService _gameService;

  @override
  Future<FetchListReponse<GameCategory>> fetcher() async {
    final data = await _gameService.getCategories();

    return FetchListReponse(
      data: data,
    );
  }
}
