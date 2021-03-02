import 'package:flutter/material.dart';

class ATab extends StatelessWidget {
  final String text;
  final Widget icon;

  const ATab({Key key, this.text, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      text: text??"",
      icon: icon,
    );
  }

}