import 'package:brinkeduca/components/flip_card_grid.dart';
import 'package:brinkeduca/core/session.dart';
import 'package:brinkeduca/data/item_card_list.dart';
import 'package:flutter/material.dart';

class FlipCardGridBuilder extends StatefulWidget {
  String firebaseKey;
  bool startGame;
  dynamic data;

  FlipCardGridBuilder({this.startGame, this.firebaseKey}) {
    if (Session.shared.onlineApp) {
      this.data = ItemCardList.getPairsOfCardsOnline(firebaseKey);
    } else {
      this.data = ItemCardList.getPairsOfCardsOffline();
    }
  }

  @override
  _FlipCardGridBuilderState createState() => _FlipCardGridBuilderState(data);
}

class _FlipCardGridBuilderState extends State<FlipCardGridBuilder> {
  final dynamic data;

  // Recebendo data na inicialização do widget para o mesmo use o mesmo
  // data em cada build
  _FlipCardGridBuilderState(this.data);

  @override
  Widget build(BuildContext context) {
    if (Session.shared.onlineApp) {
      return FutureBuilder(
        future: data,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Center(
                child: Text('loading...'),
              );
            default:
              if (snapshot.hasError)
                return new Center(
                  child: Text(
                    'Error: ${snapshot.error}',
                  ),
                );
              else
                return FlipCardGrid(
                  snapshot.data,
                  startGame: widget.startGame,
                );
          }
        },
      );
    } else {
      return FlipCardGrid(
        data,
        startGame: widget.startGame,
      );
    }
  }
}
