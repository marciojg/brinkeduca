import 'package:flutter/material.dart';
import 'package:flutter_app/core/routes.dart';
import 'package:flutter_app/screens/game1Page.dart';
import 'package:flutter_app/screens/menuPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'BrinkEduca',
        initialRoute: Routes.menu,
        routes: {
          Routes.menu: (context) => MenuPage(),
          Routes.game_1: (context) => Game1Page(),
        }
    );
  }
}


