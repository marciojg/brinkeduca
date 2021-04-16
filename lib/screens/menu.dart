import 'package:flutter/material.dart';
import 'package:brinkeduca/components/menu_builder.dart';
import 'package:brinkeduca/core/session.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Session.shared.nameApp),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: MenuBuilder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
