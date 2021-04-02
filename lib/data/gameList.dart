import 'package:flutter_app/core/routes.dart';

import 'GameModel.dart';

class GameList {
  static List<GameModel> getGames() {
    return [
      GameModel('Jogo da Memória', Routes.memoryGame)
    ];
  }
}

