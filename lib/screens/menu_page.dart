import 'package:flutter/material.dart';
import 'package:flutter_app/components/menu_list.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BrinkEduca'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: MenuList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
