import 'package:flutter/material.dart';

class ACircleAvatar extends StatelessWidget {
  final ImageProvider backgroundImage;

  const ACircleAvatar({Key key, this.backgroundImage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: backgroundImage,
    );
  }

}