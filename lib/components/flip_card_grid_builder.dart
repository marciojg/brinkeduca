import 'package:flutter/material.dart';
import 'package:flutter_app/components/flip_card_grid.dart';
import 'package:flutter_app/core/session.dart';
import 'package:flutter_app/data/card_list.dart';

class FlipCardGridBuilder extends StatefulWidget {
  String firebaseKey;
  bool startGame;
  dynamic data;

  FlipCardGridBuilder({this.startGame, this.firebaseKey}) {
    if (Session.shared.onlineApp) {
      this.data = CardList.getPairsOfCardsOnline(firebaseKey);
    } else {
      this.data = CardList.getPairsOfCardsOffline();
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
