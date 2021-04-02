import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/components/flip_card_grid.dart';
import 'package:flutter_app/components/initial_timer.dart';

const int TIME_TO_AWAIT = 5;

class MemoryGame extends StatefulWidget {
  @override
  _MemoryGameState createState() => _MemoryGameState();
}

class _MemoryGameState extends State<MemoryGame> {
  int _time = TIME_TO_AWAIT;
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
