import 'package:brinkeduca/screens/mode_app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:brinkeduca/core/routes.dart';
import 'package:brinkeduca/core/session.dart';
import 'package:brinkeduca/screens/auth.dart';
import 'package:brinkeduca/screens/memory_game.dart';
import 'package:brinkeduca/screens/menu.dart';

Future<void> main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(BrinkEduca());
}

class BrinkEduca extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: Session.shared.nameApp,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.auth,
        routes: {
          Routes.auth: (context) => Auth(),
          Routes.modeApp: (context) => ModeApp(),
          Routes.menu: (context) => Menu(),
          Routes.memoryGame: (context) => MemoryGame(),
        }
    );
  }
}