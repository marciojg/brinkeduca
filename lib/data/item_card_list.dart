import 'package:brinkeduca/core/session.dart';
import 'package:brinkeduca/data/models/itme_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemCardList {
  static List<ItemCard> getPairsOfCardsOffline() {
    List<String> sourceArray = Session.shared.imagesSourceArray;
    List<ItemCard> pairOfCards = [];

    sourceArray.forEach((pathname) {
      pairOfCards.add(ItemCard(pathname));
      pairOfCards.add(ItemCard(pathname));
    });

    pairOfCards.shuffle();
    return pairOfCards;
  }

  static Future<List<ItemCard>> getPairsOfCardsOnline(
      String firebaseKey) async {
    List<ItemCard> pairOfCards = [];
    QuerySnapshot querySnapshot = await Session.shared.firebaseFirestore
        .collection('games')
        .doc(firebaseKey)
        .collection('cards')
        .get();

    querySnapshot.docs.forEach((snapshot) {
      if (snapshot != null) {
        pairOfCards.add(ItemCard.fromSnapshot(snapshot));
        pairOfCards.add(ItemCard.fromSnapshot(snapshot));
      }
    });

    pairOfCards.shuffle();
    return pairOfCards;
  }
}
