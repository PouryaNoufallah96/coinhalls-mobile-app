import 'package:coin_hall/core/blocs/fetch_list_base_cubit/fetch_list_base_cubit.dart';
import 'package:coin_hall/core/services/game_service/game_service.dart';
import 'package:coin_hall/core/services/game_service/models.dart';

class GameListCubit extends FetchListBaseCubit<GameData> {
  GameListCubit({
    required GameService gameService,
  }) : _gameService = gameService;

  final GameService _gameService;

  @override
  Future<List<GameData>> fetcher() => _gameService.listOfGames();
}
