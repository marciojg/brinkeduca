// ignore: must_be_immutable
import 'dart:async';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InitialTimer extends StatefulWidget {

  @override
  _InitialTimerState createState() => _InitialTimerState();
}

class _InitialTimerState extends State<InitialTimer> {
  int _time = 5;
  Timer _timer;

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (this.mounted) {
        setState(() => _time--);
      }
    });
  }

  void stopTimer() {
    setState(() => _timer.cancel());
  }

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    var timeEnded = _time == 0;
    var text = '$_time';

    if (timeEnded) {
      stopTimer();
      text = '';
    }

    return Text(
      text,
      style: Theme.of(context).textTheme.headline3,
    );
  }
}