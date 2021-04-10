import 'package:cloud_firestore/cloud_firestore.dart';

// TODO: Melhorar para ser um singleton
class FirebaseConnection {
  static final FirebaseFirestore instance = FirebaseFirestore.instance;
}
