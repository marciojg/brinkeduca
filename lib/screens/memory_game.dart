import 'package:flutter/material.dart';
import 'package:brinkeduca/components/flip_card_grid_builder.dart';
import 'package:brinkeduca/components/start_game.dart';
import 'package:brinkeduca/core/session.dart';

class MemoryGame extends StatefulWidget {
  @override
  _MemoryGameState createState() => _MemoryGameState();
}

class _MemoryGameState extends State<MemoryGame> {
  bool canStartGame = false;

  // callback
  void startGame(bool start) {
    setState(() => canStartGame = start);
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(Session.shared.nameApp),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: StartGame(
                  initialStatus: canStartGame,
                  onSonChanged: (bool start) => startGame(start),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: FlipCardGridBuilder(
                  startGame: canStartGame,
                  firebaseKey: args['firebaseKey'],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
