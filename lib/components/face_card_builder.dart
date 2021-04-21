import 'package:brinkeduca/core/session.dart';
import 'package:brinkeduca/data/card_model.dart';
import 'package:flutter/material.dart';

import 'face_card.dart';

class FaceCardBuilder extends StatelessWidget {
  CardModel card;
  bool opacity;

  FaceCardBuilder({this.card, this.opacity = false}) {
    this.opacity = (card != null && card.getIsSelected) ? true : opacity;
    this.card = card != null ? card : CardModel();
  }

  Future<String> _downloadURL(CardModel card) async {
    String downloadURL = await Session.shared.firebaseStorage
        .ref(card.getImageAssetPath)
        .getDownloadURL();

    return downloadURL;
  }

  @override
  Widget build(BuildContext context) {
    if (Session.shared.onlineApp) {
      return FutureBuilder(
        future: _downloadURL(card),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (snapshot.hasError)
                return new Center(
                  child: Text(
                    'Error: ${snapshot.error}',
                  ),
                );
              else
                return FaceCard(snapshot.data, opacity: opacity);
          }
        },
      );
    } else {
      return FaceCard(
        card.getImageAssetPath,
        opacity: opacity,
      );
    }
  }
}
