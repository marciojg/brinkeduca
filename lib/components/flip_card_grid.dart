import 'dart:async';

import 'package:brinkeduca/components/face_card_builder.dart';
import 'package:brinkeduca/data/models/itme_card.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class FlipCardGrid extends StatefulWidget {
  List<ItemCard> _data;
  bool startGame;

  FlipCardGrid(this._data, {this.startGame});

  @override
  _FlipCardGridState createState() => _FlipCardGridState(_data);
}

class _FlipCardGridState extends State<FlipCardGrid> {
  final List<ItemCard> _data;

  ItemCard lastCard;

  // Forçar o uso do _data recebido na instância de FlipCard, ou seja, que
  // ele não seja alterado a cada build.
  _FlipCardGridState(this._data);

  Widget itemCard(ItemCard currentCard, bool startGame) {
    bool isPair() {
      return lastCard.getImageAssetPath == currentCard.getImageAssetPath;
    }

    bool isSameCard() {
      return lastCard?.getKey == currentCard.getKey;
    }

    void markThatEqual() {
      setState(() {
        currentCard.setIsSelected(true);
        lastCard.setIsSelected(true);
        lastCard = null;
      });
    }

    void markThatNotEqual() {
      Future.delayed(const Duration(milliseconds: 1000), () {
        currentCard.getKey.currentState.toggleCard();
        lastCard.getKey.currentState.toggleCard();
        lastCard = null;
      });
    }

    return FlipCard(
      key: currentCard.getKey,
      onFlipDone: (bool completeFlip) {
        if (completeFlip) {
          if (isSameCard()) {
            lastCard = null;
          }
        } else {
          if (lastCard == null) {
            lastCard = currentCard;
          } else {
            isPair() ? markThatEqual() : markThatNotEqual();
          }
        }
      },
      flipOnTouch: widget.startGame ? !currentCard.getIsSelected : false,
      front: widget.startGame
          ? FaceCardBuilder()
          : FaceCardBuilder(card: currentCard, opacity: true),
      back: !widget.startGame
          ? FaceCardBuilder()
          : FaceCardBuilder(card: currentCard),
    );
  }

  void finishGame() {
    if (_data.every((d) => d.getIsSelected == true)) {
      Future.delayed(const Duration(milliseconds: 160), () {
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _listCard = _data;
    final _startGame = widget.startGame;

    finishGame();

    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: _listCard.length,
        itemBuilder: (context, index) {
          final card = _listCard[index];
          return itemCard(card, _startGame);
        });
  }
}
