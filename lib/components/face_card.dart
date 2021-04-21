import 'package:flutter/material.dart';

class FaceCard extends StatelessWidget {
  bool opacity;
  String imagePath;

  FaceCard(this.imagePath, {this.opacity = false});

  ImageProvider<Object> _getImage() {
    bool onlineImage = this.imagePath.contains('http');

    return onlineImage
        ? NetworkImage(this.imagePath)
        : AssetImage(this.imagePath);
  }

  @override
  Widget build(BuildContext context) {
    _getImage();
    return Container(
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(70),
        image: new DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(opacity ? 0.7 : 1.0),
            BlendMode.dstATop,
          ),
          image: _getImage(),
        ),
      ),
    );
  }
}
