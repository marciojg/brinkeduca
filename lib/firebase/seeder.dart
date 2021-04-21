import 'package:brinkeduca/core/session.dart';

class Seeder {
  static call() {
    var fs = Session.shared.firebaseFirestore;

    fs
        .collection('games')
        .add({'name': 'Jogo da Memória', 'page': '/memory-game'}).then((value) {
      print('${value.id}------------------');
      var fsCards = fs.collection('games').doc(value.id).collection('cards');

      fsCards.add({'name': 'Elefante', 'image': 'assets/animals/elephant.png'});
      fsCards.add({'name': 'Raposa', 'image': 'assets/animals/fox.png'});
      fsCards.add({'name': 'Hipopótamo', 'image': 'assets/animals/hippo.png'});
      fsCards.add({'name': 'Cavalo', 'image': 'assets/animals/horse.png'});
      fsCards.add({'name': 'Macaco', 'image': 'assets/animals/monkey.png'});
      fsCards.add({'name': 'Urso Panda', 'image': 'assets/animals/panda.png'});
      fsCards.add({'name': 'Papagaio', 'image': 'assets/animals/parrot.png'});
      fsCards.add({'name': 'Coelho', 'image': 'assets/animals/rabbit.png'});

      print('criei um jogo e add uma colecao de cards');
    });
  }
}
