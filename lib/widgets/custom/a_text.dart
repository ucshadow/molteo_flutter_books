import 'package:flutter/material.dart';

class AText extends StatelessWidget {
  final String data;
  final TextStyle style;
  final TextAlign textAlign;

  const AText(this.data, {
    Key key,
    this.style,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(data??"", textAlign: textAlign ?? TextAlign.left, style: style);
  }
}
