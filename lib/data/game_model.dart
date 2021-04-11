import 'package:cloud_firestore/cloud_firestore.dart';

class GameModel {
  String id;
  String name;
  String page;

  GameModel(this.name, this.page, { this.id });

  GameModel.fromSnapshot(QueryDocumentSnapshot snapshot)
    : id   = snapshot.id,
      name = snapshot.data()['name'],
      page = snapshot.data()['page'];
}