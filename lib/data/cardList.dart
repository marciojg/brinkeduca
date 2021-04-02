import 'package:cloud_firestore/cloud_firestore.dart';
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
  final firestoreInstance = FirebaseFirestore.instance;

  firestoreInstance.collection("users").add(
      {
        "name" : "john",
        "age" : 50,
        "email" : "example@example.com",
        "address" : {
          "street" : "street 24",
          "city" : "new york"
        }
      }).then((value){
    print(value.id);
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