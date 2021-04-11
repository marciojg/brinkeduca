import 'package:flutter/material.dart';
import 'package:flutter_app/data/game_model.dart';

class MenuItems extends StatefulWidget {
  List<GameModel> listGames;

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
        GameModel menuItem = widget.listGames[index];
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                menuItem.page,
                arguments: {'firebaseKey': menuItem.id },
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
                          Icons.auto_stories,
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
