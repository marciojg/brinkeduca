import 'package:brinkeduca/components/button.dart';
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
            Button(text: 'Modo Offline', function: () {
              Session.shared.onlineApp = false;
              Navigator.of(context).pushNamed(Routes.menu);
            }),
            Button(text: 'Modo Online', function: () {
              Session.shared.onlineApp = true;
              Navigator.of(context).pushNamed(Routes.menu);
            }),
          ],
        ),
      ),
    );
  }
}
