import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';


List<String> fillSourceArray() {
  return [
    'assets/fox.png',
    'assets/fox.png',
    'assets/horse.png',
    'assets/horse.png',
    'assets/panda.png',
    'assets/panda.png',
  ];
}

List getSourceArray() {
  List<String> levelAndKindList = <String>[];
  List sourceArray = fillSourceArray();

  sourceArray.forEach((element) {
    levelAndKindList.add(element);
  });

  levelAndKindList.shuffle();
  return levelAndKindList;
}

List<bool> getInitialItemState() {
  List<bool> initialItemState = <bool>[];

  for (int i = 0; i < fillSourceArray().length; i++) {
    initialItemState.add(true);
  }

  return initialItemState;
}

List<GlobalKey<FlipCardState>> getCardStateKeys() {
  List<GlobalKey<FlipCardState>> cardStateKeys =
      <GlobalKey<FlipCardState>>[];

  for (int i = 0; i < fillSourceArray().length; i++) {
    cardStateKeys.add(GlobalKey<FlipCardState>());
  }

  return cardStateKeys;
}
