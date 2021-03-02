import 'package:flutter/material.dart';

class ACenter extends StatelessWidget {

  final Widget child;

  const ACenter({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: child,
    );
  }

}