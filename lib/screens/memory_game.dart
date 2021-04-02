import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/initial_timer.dart';
import 'package:flutter_app/data/cardList.dart';
import 'package:flutter_app/data/cardModel.dart';

class MemoryGame extends StatefulWidget {
  @override
  _MemoryGameState createState() => _MemoryGameState();
}

class _MemoryGameState extends State<MemoryGame> {
  int _time = 5;
  Timer _timer;

  bool canStartGame() {
    return _time == 0;
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (this.mounted) {
        setState(() => _time--);
      }
    });
  }

  void stopTimer() {
    if (canStartGame()) {
      setState(() => _timer.cancel());
    }
  }

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    stopTimer();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: InitialTimer(_time),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: FlipCardGrid(startGame: canStartGame()),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FlipCardGrid extends StatefulWidget {
  final List<CardModel> _data = getPairsOfCards();
  bool startGame;

  FlipCardGrid({ this.startGame });

  @override
  _FlipCardGridState createState() => _FlipCardGridState(_data);
}

class _FlipCardGridState extends State<FlipCardGrid> {
  final List<CardModel> _data;

  // Forçar o uso do _data recebido na instância de FlipCard, ou seja, que
  // ele não seja alterado a cada build.
  _FlipCardGridState(this._data);

  @override
  Widget build(BuildContext context) {
    final _listCard = _data;
    final _startGame = widget.startGame;

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: _listCard.length,
      itemBuilder: (context, index) {
        final card = _listCard[index];
        return ItemCard(card, _startGame);
      }
    );
  }
}

// ignore: must_be_immutable
class ItemCard extends StatelessWidget {
  CardModel card;
  bool startGame;

  ItemCard(this.card, this.startGame);

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      key: card.getKey,
      onFlip: () {}, //temporario
      flipOnTouch: startGame ? !card.getIsSelected : false,
      front: startGame ? Face() : Face(card: card),
      back: !startGame ? Face() : Face(card: card),
    );
  }
}

// ignore: must_be_immutable
class Face extends StatelessWidget {
  CardModel card;

  Face({ this.card });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      child: Image.asset(
        card != null ? card.getImageAssetPath : 'assets/question.png'
      ),
    );
  }
}


