import 'package:flutter_app/firebase/firebase_connection.dart';

class Seeder {
  static call() {
    var fs = FirebaseConnection.instance;

    fs.collection('games').add(
        {
          'name': 'Jogo da Memória (Online)',
          'page': '/memory-game'
        }
    ).then((value) {
      print('${value.id}------------------');
      var fsCards = fs.collection('games')
          .doc(value.id)
          .collection('cards');

      fsCards.add({'name': 'Elefante', 'image': 'assets/elephant.png'});
      fsCards.add({'name': 'Raposa', 'image': 'assets/fox.png'});
      fsCards.add({'name': 'Hipopótamo', 'image': 'assets/horse.png'});
      fsCards.add({'name': 'Cavalo', 'image': 'assets/monkey.png'});
      fsCards.add({'name': 'Macaco', 'image': 'assets/monkey.png'});
      fsCards.add({'name': 'Urso Panda', 'image': 'assets/panda.png'});
      fsCards.add({'name': 'Papagaio', 'image': 'assets/parrot.png'});
      fsCards.add({'name': 'Coelho', 'image': 'assets/rabbit.png'});

      print('aaaaaaaaaaaaaaaaaa');
    });
  }
}