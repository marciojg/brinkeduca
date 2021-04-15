import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_app/core/routes.dart';
import 'package:flutter_app/core/session.dart';
import 'package:flutter_app/screens/auth.dart';
import 'package:flutter_app/screens/memory_game.dart';
import 'package:flutter_app/screens/menu.dart';

Future<void> main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Session.shared.onlineApp = true;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: Session.shared.nameApp,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.auth,
        routes: {
          Routes.auth: (context) => Auth(),
          Routes.menu: (context) => Menu(),
          Routes.memoryGame: (context) => MemoryGame(),
        }
    );
  }
}