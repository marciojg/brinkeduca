import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Session {
  static final Session _singleton = Session._internal();
  factory Session() => _singleton;

  Session._internal();

  static Session get shared => _singleton;

  UserCredential user;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  firebase_storage.FirebaseStorage firebaseStorage =
      firebase_storage.FirebaseStorage.instanceFor(
          bucket: 'gs://brinkeduca-667c6.appspot.com');
  String authBaseAddress = 'https://brinkeduca-api.herokuapp.com/students/auth';
  String nameApp = 'BrinkEduca';
  String studentName;
  bool onlineApp;
  List<String> imagesSourceArray = [
    'assets/biology/elephant.png',
    'assets/biology/fox.png',
    'assets/biology/panda.png',
    'assets/biology/parrot.png',
    'assets/biology/monkey.png',
    'assets/biology/horse.png',
  ];
}
