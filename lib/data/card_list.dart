import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brinkeduca/core/session.dart';
import 'package:brinkeduca/data/card_model.dart';
import 'package:brinkeduca/firebase/firebase_connection.dart';

class CardList {

  static List<CardModel> getPairsOfCardsOffline() {
    List<String> sourceArray = Session.shared.imagesSourceArray;
    List<CardModel> pairOfCards = [];

    sourceArray.forEach((pathname) {
      pairOfCards.add(CardModel(pathname));
      pairOfCards.add(CardModel(pathname));
    });

    pairOfCards.shuffle();
    return pairOfCards;
  }

  static Future<List<CardModel>> getPairsOfCardsOnline(String firebaseKey) async {
    List<CardModel> pairOfCards = [];
    QuerySnapshot querySnapshot = await FirebaseConnection
        .instance
        .collection('games')
        .doc(firebaseKey)
        .collection('cards')
        .get();

    querySnapshot.docs.forEach((snapshot) {
      if (snapshot != null) {
        pairOfCards.add(CardModel.fromSnapshot(snapshot));
        pairOfCards.add(CardModel.fromSnapshot(snapshot));
      }
    });

    pairOfCards.shuffle();
    return pairOfCards;
  }
}