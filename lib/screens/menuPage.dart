import 'package:flutter/material.dart';
import 'package:flutter_app/core/routes.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BrinkEduca'),
        ),
        body: GridView.count(
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: List.generate(4, (index) {
            return InkWell(
                child: Container(
                  padding: EdgeInsets.all(20),
                  color: Colors.blueAccent[100],
                  child: Center(
                    child: Text(
                      'Jogo $index',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, Routes.game_1);
                }
            );
          }),
        )
    );
  }
}