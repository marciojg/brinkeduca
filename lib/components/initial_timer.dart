import 'dart:async';

import 'package:flutter/material.dart';


class InitialTimer extends StatefulWidget {
  Timer timer;
  int time;

  InitialTimer(this.time);

  @override
  _InitialTimerState createState() => _InitialTimerState();
}

class _InitialTimerState extends State<InitialTimer> {
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

  @override
  Widget build(BuildContext context) {
    stopTimer();

    return canStartGame() ?
      Container() :
      Text(
        '${widget.time}',
        style: Theme.of(context).textTheme.headline3,
      );
    }
}