import 'package:flutter/material.dart';

class AButtonBar extends StatelessWidget {

  final List<Widget> children;

  const AButtonBar({Key key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: children,
    );
  }

}