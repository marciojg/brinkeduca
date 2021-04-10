import 'package:flutter/material.dart';
import 'package:flutter_app/data/game_list.dart';

import 'menu_items.dart';

class MenuBuilder extends StatefulWidget {
  final bool onlineApp = true;

  @override
  _MenuBuilderState createState() => _MenuBuilderState();
}

class _MenuBuilderState extends State<MenuBuilder> {
  @override
  Widget build(BuildContext context) {
    if (widget.onlineApp) {
      return FutureBuilder(
        future: GameList.getOnlineGames(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('loading...');
            default:
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              else
                return MenuItems(snapshot.data);
          }
        },
      );
    } else {
      return MenuItems(GameList.getOfflineGames());
    }
  }
}