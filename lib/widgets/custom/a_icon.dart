import 'package:flutter/material.dart';

class AIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;

  const AIcon(this.icon, {Key key, this.color, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: color,
      size: size,
    );
  }
}