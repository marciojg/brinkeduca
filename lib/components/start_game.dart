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
      return GestureDetector(
        onTap: () => onSonChanged(true),
        child: Container(
          height: 50,
          width: 200,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Text(
            'Iniciar Jogo',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }
  }
}
