import 'package:flutter/material.dart';
import 'package:flutter_app/components/flip_card_grid.dart';
import 'package:flutter_app/data/card_list.dart';

class FlipCardGridBuilder extends StatefulWidget {
  final bool onlineApp = true;
  int time;
  String firebaseKey;

  FlipCardGridBuilder(this.time, { this.firebaseKey });

  @override
  _FlipCardGridBuilderState createState() =>
      _FlipCardGridBuilderState(this.time, firebaseKey: this.firebaseKey);
}

class _FlipCardGridBuilderState extends State<FlipCardGridBuilder> {
  int time;
  String firebaseKey;

  // Forçar que o time não mude seu valor quando o widget for rebuildado
  _FlipCardGridBuilderState(this.time, { this.firebaseKey });

  @override
  Widget build(BuildContext context) {
    if (widget.onlineApp) {
      return FutureBuilder(
        future: CardList.getPairsOfCardsOnline(firebaseKey),
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
                ));
              else
                return FlipCardGrid(
                  snapshot.data,
                  time: widget.time,
                );
          }
        },
      );
    } else {
      return FlipCardGrid(
        CardList.getPairsOfCardsOffline(),
        time: widget.time,
      );
    }
  }
}
