import 'package:flutter_app/core/routes.dart';

import 'GameModel.dart';

class GameList {
  static List<GameModel> getGames() {
    return [
      GameModel('Jogo da Memória', Routes.game_1),
      GameModel('Novo da memoria brabo', Routes.memoryGame)
    ];
  }
}

