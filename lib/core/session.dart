class Session {
  static final Session _singleton = Session._internal();
  factory Session() => _singleton;

  Session._internal();

  static Session get shared => _singleton;

  String nameApp = 'BrinkEduca';
  bool onlineApp;
}