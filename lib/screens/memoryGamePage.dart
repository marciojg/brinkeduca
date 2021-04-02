import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/routes.dart';
import 'package:flutter_app/data/cardList.dart';
import 'package:flutter_app/data/cardModel.dart';
import 'dart:async';

class MemoryGamePage extends StatefulWidget {
  @override
  _MemoryGamePageState createState() => _MemoryGamePageState();
}

class _MemoryGamePageState extends State<MemoryGamePage> {

  int _previousIndex = -1;
  bool _flip = false;
  bool _start = false;
  bool _wait = false;

  Timer _timer;
  int _time = 5;
  int _left;
  List<CardModel> _data;

  @override
  void initState() {
    super.initState();

    restart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: initialTimer()
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: _data.length,
                  itemBuilder: (context, index) {
                    if(_start) {
                      return flipCard(index);
                    } else {
                      return getItem(index);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget flipCard(int index) {
    return FlipCard(
        key: _data[index].getKey,
        onFlip: () {
          if (!_flip) {
            _flip = true;
            _previousIndex = index;
          } else {
            _flip = false;
            if (_previousIndex != index) {
              if (_data[_previousIndex].getImageAssetPath != _data[index].getImageAssetPath) {
                _wait = true;

                Future.delayed(
                  const Duration(milliseconds: 1500), () {
                    _data[_previousIndex].getKey.currentState.toggleCard();
                    _data[index].getKey.currentState.toggleCard();

                  Future.delayed(
                    const Duration(milliseconds: 160), () {
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
                    const Duration(milliseconds: 160), () {
                      setState(() { _start = false; });
                      Navigator.pushNamed(
                          context,
                           Routes.playAgain
                      );
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
  }

  Widget initialTimer() {
    return Text(
      (_time > 0) ? '$_time' : 'Faltam: $_left',
      style: Theme.of(context).textTheme.headline3,
    );
  }

  Widget getItem(int index) {
    return Container(
      margin: EdgeInsets.all(4.0),
      child: Image.asset(_data[index].getImageAssetPath),
    );
  }

  startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      try {
        setState(() {
          _time = _time - 1;
        });
      } catch(_) {
        return null;
      }
    });
  }

  void restart() {
    startTimer();
    _data = getPairsOfCards();
    _time = 5;
    _left = (_data.length ~/ 2);

    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _start = true;
        _timer.cancel();
      });
    });
  }
}
