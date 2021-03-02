import 'package:flutter/material.dart';

class ACard extends StatelessWidget {

  final Widget child;
  final double elevation;
  final Color color;

  const ACard({Key key, this.child, this.elevation, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: child,
      color:color,
      elevation: elevation??1,
    );
  }

}