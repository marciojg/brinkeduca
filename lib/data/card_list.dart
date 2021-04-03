import 'package:flutter_app/data/card_model.dart';

List<String> _imagesSourceArray() {
  return [
    'assets/elephant.png',
    'assets/fox.png',
    'assets/horse.png',
    'assets/monkey.png',
    'assets/panda.png',
    'assets/parrot.png',
    'assets/rabbit.png',
  ];
}

List<CardModel> getPairsOfCards() {
  List<String> sourceArray = _imagesSourceArray();
  List<CardModel> pairOfCards = [];

  sourceArray.forEach((pathname) {
    pairOfCards.add(CardModel(pathname));
    pairOfCards.add(CardModel(pathname));
  });

  pairOfCards.shuffle();
  return pairOfCards;
}