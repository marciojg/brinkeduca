import 'package:flutter/material.dart';
import 'package:flutter_app/data/card_model.dart';

class FaceCard extends StatelessWidget {
  CardModel card;
  bool opacity;

  FaceCard({ this.card, this.opacity = false }) {
    this.opacity = (card != null && card.getIsSelected) ? true : opacity;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(70),
        image: new DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(opacity ? 0.7 : 1.0),
            BlendMode.dstATop,
          ),
          image: AssetImage(
            card != null ? card.getImageAssetPath : 'assets/question.png'
          ),
        ),
      ),
    );
  }
}
