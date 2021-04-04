import 'package:flutter_app/core/routes.dart';

import 'game_model.dart';

class GameList {
  static List<GameModel> getOfflineGames() {
    return [
      GameModel('Jogo da Memória', Routes.memoryGame)
    ];
  }
}

