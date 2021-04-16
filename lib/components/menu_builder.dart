import 'package:flutter/material.dart';
import 'package:brinkeduca/core/session.dart';
import 'package:brinkeduca/data/game_list.dart';

import 'menu_items.dart';

class MenuBuilder extends StatefulWidget {
  @override
  _MenuBuilderState createState() => _MenuBuilderState();
}

class _MenuBuilderState extends State<MenuBuilder> {
  @override
  Widget build(BuildContext context) {
    if (Session.shared.onlineApp) {
      return FutureBuilder(
        future: GameList.getOnlineGames(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: Text('loading...'),
              );
            default:
              if (snapshot.hasError)
                return Center(
                    child: Text(
                  'Error: ${snapshot.error}',
                ));
              else
                return MenuItems(
                  snapshot.data,
                );
          }
        },
      );
    } else {
      return MenuItems(
        GameList.getOfflineGames(),
      );
    }
  }
}
