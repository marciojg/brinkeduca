import 'package:brinkeduca/components/buttons.dart';
import 'package:brinkeduca/core/routes.dart';
import 'package:brinkeduca/core/session.dart';
import 'package:flutter/material.dart';

class ModeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Session.shared.nameApp),
      ),
      body: Container(
        padding: const EdgeInsets.all(100.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text('Bem vindo(a) ${Session.shared.studentName}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Buttons.defaultButton(
                  text: 'Modo Offline',
                  onTapFunction: () {
                    Session.shared.onlineApp = false;
                    Navigator.of(context).pushNamed(Routes.menu);
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Buttons.defaultButton(
                  text: 'Modo Online',
                  onTapFunction: () {
                    Session.shared.onlineApp = true;
                    Navigator.of(context).pushNamed(Routes.menu);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
