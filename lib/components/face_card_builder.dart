import 'package:brinkeduca/core/session.dart';
import 'package:brinkeduca/data/card_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
                return CachedNetworkImage(
                  imageUrl: snapshot.data,
                  imageBuilder: (context, imageProvider) => Container(
                    margin: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      image: DecorationImage(
                        image: imageProvider,
                        colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(opacity ? 0.7 : 1.0),
                          BlendMode.dstATop,
                        ),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                );
          }
        },
      );
    } else {
      return Container(
        margin: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(70),
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(opacity ? 0.7 : 1.0),
              BlendMode.dstATop,
            ),
            image: AssetImage(card.getImageAssetPath),
          ),
        ),
      );
    }
  }
}
