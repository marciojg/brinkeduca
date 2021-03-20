import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final title = 'BrinkEduca';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: title,
        home: Scaffold(
            appBar: AppBar(
              title: Text(title),
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
                    print('aaaaaaaaaaa $index');
                  }
                );
              }),
            )
        )
    );
  }
}
