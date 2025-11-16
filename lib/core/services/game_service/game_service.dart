import 'package:coin_hall/core/services/game_service/models.dart';
import 'package:coin_hall/core/services/http_service/http_service.dart';

class GameService {
  GameService({
    required HttpService adapter,
  }) : _adapter = adapter;

  final HttpService _adapter;

  Future<List<GameCategory>> getCategories() async {
    final res = await _adapter
        .requestUri<Map<String, dynamic>>(Uri.parse('Game/GetGamesCategories'));

    return res.parsedList(GameCategory.fromJson);
  }

  Future<List<GameData>> listOfGames(String token) async {
    final res = await _adapter.requestUri<Map<String, dynamic>>(
        Uri.parse('Game/GetGameList'),
        method: HttpMethod.post,
        body: {
          'tokenAddress': token,
        });

    return res.parsedListData(GameData.fromJson);
  }
}
