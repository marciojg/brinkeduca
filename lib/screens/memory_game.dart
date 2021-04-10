import 'package:flutter/material.dart';
import 'package:flutter_app/components/flip_card_grid_builder.dart';
import 'package:flutter_app/components/initial_timer.dart';

const int TIME_TO_WAIT = 5;

class MemoryGame extends StatefulWidget {
  @override
  _MemoryGameState createState() => _MemoryGameState();
}

class _MemoryGameState extends State<MemoryGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BrinkEduca'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: InitialTimer(TIME_TO_WAIT),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: FlipCardGridBuilder(TIME_TO_WAIT),
              )
            ],
          ),
        ),
      ),
    );
  }
}
