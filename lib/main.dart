// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/routes.dart';
import 'package:flutter_app/screens/memoryGamePage.dart';
import 'package:flutter_app/screens/menuPage.dart';
import 'package:flutter_app/screens/playAgainPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'BrinkEduca',
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.menu,
        routes: {
          Routes.menu: (context) => MenuPage(),
          Routes.game_1: (context) => MemoryGamePage(),
          Routes.playAgain: (context) => PlayAgainPage()
        }
    );
  }
}


