import 'package:brinkeduca/data/models/game.dart';
import 'package:flutter/material.dart';

class MenuItems extends StatefulWidget {
  List<Game> listGames;

  MenuItems(this.listGames);

  @override
  _MenuItemsState createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: widget.listGames.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        Game menuItem = widget.listGames[index];
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                menuItem.page,
                arguments: {'firebaseKey': menuItem.id},
              );
            },
            child: Center(
              child: Column(
                children: [
                  Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0)),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.apps,
                          size: 50,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        menuItem.name,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
