import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/card_model.dart';

class FlipCardGrid extends StatefulWidget {
  Timer timer;
  int time;
  List<CardModel> _data;

  FlipCardGrid(this._data, {this.time});

  @override
  _FlipCardGridState createState() => _FlipCardGridState(_data);
}

class _FlipCardGridState extends State<FlipCardGrid> {
  final List<CardModel> _data;
  CardModel lastCard;

  // Forçar o uso do _data recebido na instância de FlipCard, ou seja, que
  // ele não seja alterado a cada build.
  _FlipCardGridState(this._data);

  bool canStartGame() {
    return widget.time == 0;
  }

  void startTimer() {
    widget.timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (this.mounted) {
        setState(() => widget.time--);
      }
    });
  }

  void stopTimer() {
    if (canStartGame()) {
      setState(() => widget.timer.cancel());
    }
  }

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  Widget itemCard(CardModel currentCard, bool startGame) {
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
      flipOnTouch: canStartGame() ? !currentCard.getIsSelected : false,
      front: canStartGame() ? Face() : Face(card: currentCard),
      back: !canStartGame() ? Face() : Face(card: currentCard),
    );
  }

  void finishGame() {
    if (_data.every((d) => d.getIsSelected == true)) {
      print("Won");

      Future.delayed(const Duration(milliseconds: 160), () {
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    stopTimer();

    final _listCard = _data;

    if (!canStartGame()) {
      Timer(Duration(seconds: 5), () {
        if (this.mounted) {
          stopTimer();
        }
      });
    }

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
          return itemCard(card, canStartGame());
        });
  }
}

// ignore: must_be_immutable
class Face extends StatelessWidget {
  CardModel card;

  Face({this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      child: Image.asset(
          card != null ? card.getImageAssetPath : 'assets/question.png'),
    );
  }
}