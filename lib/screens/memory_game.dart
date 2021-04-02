import 'package:flutter/material.dart';
import 'package:flutter_app/components/initial_timer.dart';
import 'package:flutter_app/data/cardList.dart';
import 'package:flutter_app/data/cardModel.dart';

class MemoryGame extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: InitialTimer(),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: FlipCardGrid(),
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

  @override
  _FlipCardGridState createState() => _FlipCardGridState();
}

class _FlipCardGridState extends State<FlipCardGrid> {

  @override
  Widget build(BuildContext context) {
    final _listCard = widget._data;

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: _listCard.length,
      itemBuilder: (context, index) {
        return ItemWaitingFinalTime(_listCard[index]);
      }
    );
  }
}

// ignore: must_be_immutable
class ItemWaitingFinalTime extends StatelessWidget {
  CardModel _card;

  ItemWaitingFinalTime(this._card);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      child: Image.asset(_card.getImageAssetPath),
    );
  }
}


