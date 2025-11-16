import 'package:coin_hall/core/blocs/fetch_list_base_cubit/fetch_list_base_cubit.dart';
import 'package:coin_hall/core/services/game_service/game_service.dart';
import 'package:coin_hall/core/services/game_service/models.dart';

class SelectGameCubit extends FetchListBaseCubit<GameData> {
  SelectGameCubit({
    required this.token,
    required GameService gameService,
  }) : _gameService = gameService;

  final GameService _gameService;
  final String token;

  @override
  Future<FetchListReponse<GameData>> fetcher() async {
    final data = await _gameService.listOfGames(token);
    return FetchListReponse(data: data);
  }
}
