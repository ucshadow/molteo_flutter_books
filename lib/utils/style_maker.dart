import 'dart:math';
import 'package:flutter/material.dart';

/// Used in an attempt to provide a function based approach to scaling.
/// The scaling works by providing a given factor to the width or height of
/// the screen, depending if the phone is in portrait or landscape
class StyleMaker {

  /// Mostly used to scale and style text
  static TextStyle withSize(BuildContext context, {factor=22, primary=false, color, fontWeight}) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double scaledFrom = width < height ? width : height * 0.75;

    var themeStyle = primary ? Theme.of(context).primaryTextTheme.headline1 :
    Theme.of(context).textTheme.headline1;
    return TextStyle(
      color: color??themeStyle.color,
      fontSize: (scaledFrom / factor??32).floorToDouble(),
      fontWeight: fontWeight??themeStyle.fontWeight,
      fontStyle: themeStyle.fontStyle,
      fontFamily: themeStyle.fontFamily,
    );
  }

  /// used to get the size as a double.
  static double getSize(BuildContext context, {factor=22, primary=false}) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double scaledFrom = width < height ? width : height * 0.75;
    return (scaledFrom / factor??32).floorToDouble();
  }

  static Color randomColor() {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }
}