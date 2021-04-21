import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class ItemCard {
  bool selected;
  GlobalKey<FlipCardState> key;
  String image;
  String name;

  ItemCard([this.image = 'assets/shared/question.png', this.selected = false]) {
    this.key = GlobalKey<FlipCardState>();
  }

  ItemCard.fromSnapshot(QueryDocumentSnapshot snapshot)
      : key = GlobalKey<FlipCardState>(),
        name = snapshot.data()['name'],
        image = snapshot.data()['image'],
        selected = false;

  GlobalKey<FlipCardState> get getKey {
    return key;
  }

  String get getImageAssetPath {
    return this.image;
  }

  void setIsSelected(bool selected) {
    this.selected = selected;
  }

  bool get getIsSelected {
    return this.selected;
  }
}
