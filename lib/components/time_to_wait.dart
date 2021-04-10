import 'dart:async';

class TimeToWait {
  int time;
  Timer timer;

  TimeToWait(this.time);

  bool canStartGame() {
    return time == 0;
  }

  void startTimer(Function minusTime) {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      minusTime();
    });
  }

  void stopTimer(Function cancelTimer) {
    if (canStartGame()) {
      cancelTimer();
    }
  }
}