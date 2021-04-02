import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InitialTimer extends StatelessWidget {
  int _time;

  InitialTimer(this._time);

  @override
  Widget build(BuildContext context) {
    var timeEnded = _time == 0;

    return Text(
      timeEnded ? '' : '$_time',
      style: Theme.of(context).textTheme.headline3,
    );
  }
}