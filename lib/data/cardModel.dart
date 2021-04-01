import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class CardModel {
  bool _isSelected;
  GlobalKey<FlipCardState> _key;
  final String _imageAssetPath;

  CardModel(
    this._imageAssetPath,
    [this._isSelected = false]) {
    this._key = GlobalKey<FlipCardState>();
  }

  GlobalKey<FlipCardState>get getKey {
    return _key;
  }

  String get getImageAssetPath {
    return _imageAssetPath;
  }

  void setIsSelected(bool selected) {
    _isSelected = selected;
  }

  bool get getIsSelected {
    return _isSelected;
  }
}