import 'package:flutter/material.dart';

class APadding extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const APadding({Key key, this.padding, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(top: 2, bottom: 2, left: 2, right: 2),
      child: child,
    );
  }
}
