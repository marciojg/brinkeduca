import 'package:flutter/material.dart';
import 'package:flutter_app/data/gameList.dart';

class MenuPage extends StatelessWidget {
  final _listGames = GameList.getGames();

  // TODO: Refatorar este widget que esta confuso e nao aceita mais de um item no menu
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BrinkEduca'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: _listGames.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                      _listGames[index].page
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 4,
                                  color: Colors.black45,
                                  spreadRadius: 0.5,
                                  offset: Offset(3, 4))
                            ]),
                      ),
                      Container(
                        height: 90,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.blue[300],
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 4,
                                  color: Colors.black12,
                                  spreadRadius: 0.3,
                                  offset: Offset(5, 3,),
                              )
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Text(
                                  _listGames[index].name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black26,
                                          blurRadius: 2,
                                          offset: Offset(1, 2),
                                        ),
                                        Shadow(
                                            color: Colors.green,
                                            blurRadius: 2,
                                            offset: Offset(0.5, 2))
                                      ]),
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: getStars(3),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          ),
        ),
    );
  }

  List<Widget> getStars(int no) {
    List<Widget> _icons = [];
    for (int i = 0; i < no; i++) {
      _icons.insert(i, Icon(
        Icons.star, color: Colors.yellow, )
      );
    }
    return _icons;
  }
}