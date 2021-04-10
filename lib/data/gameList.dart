import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/core/routes.dart';
import 'package:flutter_app/firebase/firebase_connection.dart';

import 'game_model.dart';

class GameList {
  static List<GameModel> getOfflineGames() {
    return [
      GameModel('Jogo da Memória', Routes.memoryGame)
    ];
  }

  static Future<List<GameModel>> getOnlineGames() async {
    List<GameModel> _games = [];
    QuerySnapshot querySnapshot = await FirebaseConnection.instance.collection('games').get();

    querySnapshot.docs.forEach((snapshot) {
      if (snapshot != null) {
        _games.add(GameModel.fromSnapshot(snapshot));
      }
    });

    // await new Future.delayed(new Duration(seconds: 5));

    return _games;
  }
}