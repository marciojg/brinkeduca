import 'package:brinkeduca/core/routes.dart';
import 'package:brinkeduca/core/session.dart';
import 'package:brinkeduca/data/models/game.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GameList {
  static List<Game> getOfflineGames() {
    return [Game('Jogo da Memória (Biologia)', Routes.memoryGame)];
  }

  static Future<List<Game>> getOnlineGames() async {
    List<Game> _games = [];
    QuerySnapshot querySnapshot =
        await Session.shared.firebaseFirestore.collection('games').get();

    querySnapshot.docs.forEach((snapshot) {
      if (snapshot != null) {
        _games.add(Game.fromSnapshot(snapshot));
      }
    });

    // await new Future.delayed(new Duration(seconds: 5));

    return _games;
  }
}
