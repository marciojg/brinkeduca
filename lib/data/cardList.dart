import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/data/cardModel.dart';

List<String> _imagesSourceArray() {
  return [
    'assets/elephant.png',
    'assets/fox.png',
    'assets/hippo.png',
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

List<GlobalKey<FlipCardState>> getCardStateKeys() {
  List<GlobalKey<FlipCardState>> cardStateKeys =
      <GlobalKey<FlipCardState>>[];

  for (int i = 0; i < getPairsOfCards().length; i++) {
    cardStateKeys.add(GlobalKey<FlipCardState>());
  }

  return cardStateKeys;
}
