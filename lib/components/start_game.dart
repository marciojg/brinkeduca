import 'package:brinkeduca/components/buttons.dart';
import 'package:flutter/material.dart';

typedef void startGame(bool start);

class StartGame extends StatelessWidget {
  bool initialStatus;
  final startGame onSonChanged;

  StartGame({@required this.initialStatus, @required this.onSonChanged});

  @override
  Widget build(BuildContext context) {
    if (initialStatus) {
      return Container();
    } else {
      return Buttons.defaultButton(text: 'Iniciar Jogo', onTapFunction: () {
        onSonChanged(true);
      });
    }
  }
}
