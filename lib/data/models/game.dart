import 'package:cloud_firestore/cloud_firestore.dart';

class Game {
  String id;
  String name;
  String page;

  Game(this.name, this.page, {this.id});

  Game.fromSnapshot(QueryDocumentSnapshot snapshot)
      : id = snapshot.id,
        name = snapshot.data()['name'],
        page = snapshot.data()['page'];
}
