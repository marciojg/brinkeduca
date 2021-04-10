import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/data/card_model.dart';
import 'package:flutter_app/firebase/firebase_connection.dart';

class CardList {
  static List<String> _imagesSourceArray() {
    return [
      'assets/elephant.png',
      'assets/rabbit.png',
      'assets/fox.png',
      'assets/panda.png',
      'assets/parrot.png',
      'assets/monkey.png',
      'assets/horse.png',
    ];
  }

  static List<CardModel> getPairsOfCardsOffline() {
    List<String> sourceArray = _imagesSourceArray();
    List<CardModel> pairOfCards = [];

    sourceArray.forEach((pathname) {
      pairOfCards.add(CardModel(pathname));
      pairOfCards.add(CardModel(pathname));
    });

    pairOfCards.shuffle();
    return pairOfCards;
  }

  static Future<List<CardModel>> getPairsOfCardsOnline() async {
    List<CardModel> pairOfCards = [];
    QuerySnapshot querySnapshot = await FirebaseConnection
        .instance
        .collection('games')
        .doc('Gp2M9CwE588TKQHJUWvs')
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