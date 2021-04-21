import 'package:brinkeduca/core/session.dart';

class Seeder {
  static call() {
    var fs = Session.shared.firebaseFirestore;

    fs.collection('games').add({
      'name': 'Jogo da Memória (Biologia)',
      'page': '/memory-game'
    }).then((value) {
      print('${value.id}------------------');
      var fsCards = fs.collection('games').doc(value.id).collection('cards');

      fsCards.add({'name': 'Elefante', 'image': 'assets/biology/elephant.png'});
      fsCards.add({'name': 'Raposa', 'image': 'assets/biology/fox.png'});
      fsCards.add({'name': 'Hipopótamo', 'image': 'assets/biology/hippo.png'});
      fsCards.add({'name': 'Cavalo', 'image': 'assets/biology/horse.png'});
      fsCards.add({'name': 'Macaco', 'image': 'assets/biology/monkey.png'});
      fsCards.add({'name': 'Urso Panda', 'image': 'assets/biology/panda.png'});
      fsCards.add({'name': 'Papagaio', 'image': 'assets/biology/parrot.png'});

      print('criei um jogo e add uma colecao de cards biology');
    });

    fs.collection('games').add({
      'name': 'Jogo da Memória (Geografia)',
      'page': '/memory-game'
    }).then((value) {
      print('${value.id}------------------');
      var fsCards = fs.collection('games').doc(value.id).collection('cards');

      fsCards.add(
          {'name': 'Astronauta', 'image': 'assets/geography/astronauta.png'});
      fsCards.add({'name': 'Foguete', 'image': 'assets/geography/foguete.png'});
      fsCards.add({'name': 'Lua', 'image': 'assets/geography/meia-lua.png'});
      fsCards.add(
          {'name': 'Meteorito', 'image': 'assets/geography/meteorito.png'});
      fsCards.add({
        'name': 'Planeta Terra',
        'image': 'assets/geography/planeta-terra.png'
      });
      fsCards
          .add({'name': 'Satélite', 'image': 'assets/geography/satelite.png'});
      fsCards.add({
        'name': 'Sistema Solar',
        'image': 'assets/geography/sistema-solar.png'
      });

      print('criei um jogo e add uma colecao de cards geography');
    });
  }
}
