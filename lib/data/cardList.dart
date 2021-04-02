import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_app/data/cardModel.dart';

List<String> _imagesSourceArray() {
  return [
    'assets/elephant.png',
    // 'assets/fox.png',
    // 'assets/hippo.png',
    // 'assets/horse.png',
    // 'assets/monkey.png',
    // 'assets/panda.png',
    // 'assets/parrot.png',
    // 'assets/rabbit.png',
  ];
}

List<CardModel> getPairsOfCards() {
  final databaseReference = FirebaseDatabase.instance.reference();

  databaseReference.child('card-exemplo-1').set({
    'name': 'aaaaaaaaa2a',
    'description': 'bbbbbbbbbbb'
  });

  databaseReference.once().then((DataSnapshot snapshot) {
    print('Data : ${snapshot.value}');
  });


  List<String> sourceArray = _imagesSourceArray();
  List<CardModel> pairOfCards = [];

  sourceArray.forEach((pathname) {
    pairOfCards.add(CardModel(pathname));
    pairOfCards.add(CardModel(pathname));
  });

  pairOfCards.shuffle();
  return pairOfCards;
}