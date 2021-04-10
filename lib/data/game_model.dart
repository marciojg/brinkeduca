import 'package:cloud_firestore/cloud_firestore.dart';

class GameModel {
  String name;
  String page;

  GameModel(this.name, this.page);

  GameModel.fromSnapshot(QueryDocumentSnapshot snapshot)
    : name = snapshot.data()['name'],
      page = snapshot.data()['page'];
}