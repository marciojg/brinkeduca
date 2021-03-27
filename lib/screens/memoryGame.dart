import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/cardList.dart';
import 'package:flutter_app/data/cardModel.dart';
import 'dart:async';

class MemoryGame extends StatefulWidget {
  MemoryGame();

  @override
  _MemoryGameState createState() => _MemoryGameState();
}

class _MemoryGameState extends State<MemoryGame> {
  _MemoryGameState();

  int _previousIndex = -1;
  bool _flip = false;
  bool _start = false;
  bool _wait = false;

  Timer _timer;
  int _time = 5;
  int _left;
  bool _isFinished;
  List<CardModel> _data;
  List<GlobalKey<FlipCardState>> _cardStateKeys;

  Widget getItem(int index) {
    return Container(
      margin: EdgeInsets.all(4.0),
      child: Image.asset(_data[index].getImageAssetPath),
    );
  }

  startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        _time = _time - 1;
      });
    });
  }

  void restart() {
    startTimer();
    _data = getPairsOfCards();
    _cardStateKeys = getCardStateKeys();
    _time = 5;
    _left = (_data.length ~/ 2);

    _isFinished = false;
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _start = true;
        _timer.cancel();
      });
    });
  }

  @override
  void initState() {
    super.initState();

    restart();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Scaffold playAgainPage() {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              restart();
            });
          },
          child: Container(
            height: 50,
            width: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Text(
              "Jogar novamente",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isFinished) {
      return playAgainPage();
    } else {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    (_time > 0) ? '$_time' : 'Faltam: $_left',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) {
                      if(_start) {
                        return FlipCard(
                            key: _cardStateKeys[index],
                            onFlip: () {
                              if (!_flip) {
                                _flip = true;
                                _previousIndex = index;
                              } else {
                                _flip = false;
                                if (_previousIndex != index) {
                                  if (_data[_previousIndex].getImageAssetPath !=
                                      _data[index].getImageAssetPath) {
                                    _wait = true;

                                    Future.delayed(
                                        const Duration(milliseconds: 1500), () {
                                      _cardStateKeys[_previousIndex]
                                          .currentState
                                          .toggleCard();
                                      _previousIndex = index;
                                      _cardStateKeys[_previousIndex]
                                          .currentState
                                          .toggleCard();

                                      Future.delayed(
                                          const Duration(milliseconds: 160),
                                              () {
                                            setState(() {
                                              _wait = false;
                                            });
                                          });
                                    });
                                  } else {
                                    _data[_previousIndex].setIsSelected(true);
                                    _data[index].setIsSelected(true);
                                    print(List.of(_data.map((e) => e.getIsSelected)));

                                    setState(() {
                                      _left -= 1;
                                    });
                                    if (_data.every((d) => d.getIsSelected == true)) {
                                      print("Won");
                                      Future.delayed(
                                          const Duration(milliseconds: 160),
                                              () {
                                            setState(() {
                                              _isFinished = true;
                                              _start = false;
                                            });
                                          });
                                    }
                                  }
                                }
                              }
                              setState(() {});
                            },
                            flipOnTouch: _wait ? false : !_data[index].getIsSelected,
                            direction: FlipDirection.HORIZONTAL,
                            front: Container(
                              margin: EdgeInsets.all(4.0),
                              child: Image.asset("assets/question.png"),
                            ),
                            back: getItem(index));
                      } else {
                        return getItem(index);
                      }
                    },
                    itemCount: _data.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
