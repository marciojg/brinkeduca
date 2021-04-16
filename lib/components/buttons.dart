import 'package:flutter/material.dart';

class Buttons {
  static defaultButton(
      {@required String text, @required Function onTapFunction}) {
    return GestureDetector(
      onTap: () => onTapFunction(),
      child: Container(
        height: 50,
        width: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  static asyncButton(
      {@required String text, @required Function onTapFunction}) {
    return GestureDetector(
      onTap: () async => await onTapFunction(),
      child: Container(
        height: 50,
        width: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
