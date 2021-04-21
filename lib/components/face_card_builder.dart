import 'package:brinkeduca/core/session.dart';
import 'package:brinkeduca/data/models/itme_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FaceCardBuilder extends StatefulWidget {
  ItemCard card;
  bool opacity;
  dynamic url;
  bool onlineApp;

  FaceCardBuilder({this.card, this.opacity = false}) {
    this.card = card != null ? card : ItemCard();
    this.opacity = card.getIsSelected ? true : opacity;
    this.onlineApp = Session.shared.onlineApp;
    this.url = onlineApp ? _downloadURL(card) : card.getImageAssetPath;
  }

  Future<String> _downloadURL(ItemCard card) async {
    String downloadURL = await Session.shared.firebaseStorage
        .ref(card.getImageAssetPath)
        .getDownloadURL();

    return downloadURL;
  }

  @override
  _FaceCardBuilderState createState() =>
      _FaceCardBuilderState(opacity: opacity, url: url, onlineApp: onlineApp);
}

class _FaceCardBuilderState extends State<FaceCardBuilder> {
  bool opacity;
  dynamic url;
  bool onlineApp;

  _FaceCardBuilderState(
      {@required this.opacity, @required this.url, @required this.onlineApp});

  @override
  Widget build(BuildContext context) {
    if (onlineApp) {
      return FutureBuilder(
        future: url,
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
            image: AssetImage(url),
          ),
        ),
      );
    }
  }
}
