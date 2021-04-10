import 'package:flutter/material.dart';
import 'package:flutter_app/components/time_to_wait.dart';

class InitialTimer extends StatefulWidget {
  TimeToWait timeToWait;

  InitialTimer(time) {
    this.timeToWait = TimeToWait(time);
  }

  @override
  _InitialTimerState createState() => _InitialTimerState();
}

class _InitialTimerState extends State<InitialTimer> {
  void minusTime() {
    if (this.mounted) {
      setState(() => widget.timeToWait.time--);
    }
  }

  void cancelTimer() {
    setState(() => widget.timeToWait.timer.cancel());
  }

  @override
  void initState() {
    super.initState();

    widget.timeToWait.startTimer(minusTime);
  }

  @override
  Widget build(BuildContext context) {
    widget.timeToWait.stopTimer(cancelTimer);

    return widget.timeToWait.canStartGame() ?
      Container() :
      Text(
        '${widget.timeToWait.time}',
        style: Theme.of(context).textTheme.headline3,
      );
    }
}