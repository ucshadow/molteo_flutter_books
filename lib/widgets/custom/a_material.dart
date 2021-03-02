import 'package:flutter/material.dart';

class AMaterial extends StatelessWidget {
  final Color color;
  final BorderRadiusGeometry borderRadius;
  final double elevation;
  final Widget child;

  const AMaterial(
      {Key key, this.color, this.borderRadius, this.elevation, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: borderRadius,
      elevation: elevation,
      child: child,
    );
  }
}
