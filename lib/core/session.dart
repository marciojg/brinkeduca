class Session {
  static final Session _singleton = Session._internal();
  factory Session() => _singleton;

  Session._internal();

  static Session get shared => _singleton;

  String nameApp = 'BrinkEduca';
  bool onlineApp;
  List<String> imagesSourceArray = [
    'assets/elephant.png',
    'assets/rabbit.png',
    'assets/fox.png',
    'assets/panda.png',
    'assets/parrot.png',
    'assets/monkey.png',
    'assets/horse.png',
  ];
}