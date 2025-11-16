import 'package:coin_hall/core/env.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class GameCategory with _$GameCategory {
  const factory GameCategory({
    required int activeGameCounts,
    String? tokenAddress,
    String? tokenSymbol,
    String? tokenName,
  }) = _GameCategory;

  factory GameCategory.fromJson(Map<String, dynamic> json) =>
      _$GameCategoryFromJson(json);
}

@freezed
class GameData with _$GameData {
  const factory GameData({
    required GameDataState state,
    required double prizeValue,
    required double targetValue,
    required String tokenSymbol,
    required String tokenName,
    required String gameName,
    required String startTime,
    required String stopTime,
    required String endTime,
    required String attachmentUrl,
    required String gameReference,
    String? tokenAddress,
    String? description,
    String? title,
  }) = _GameData;

  factory GameData.fromJson(Map<String, dynamic> json) =>
      _$GameDataFromJson(json);
}

extension GameDataX on GameData {
  String get imageUrl {
    return '${Env.apiEndPoint}File/DownloadFile/$attachmentUrl';
  }
}

enum GameDataState {
  @JsonValue('NotStarted')
  notStarted(),
  @JsonValue('Active')
  active(),
  @JsonValue('Finished')
  finished(),
  @JsonValue('Cancel')
  cancel();
}
