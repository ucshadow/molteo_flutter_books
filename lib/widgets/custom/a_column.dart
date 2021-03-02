import 'package:flutter/material.dart';

class AColumn extends StatelessWidget {
  final List<Widget> children;
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const AColumn(
      {Key key,
      this.children,
      this.mainAxisSize,
      this.mainAxisAlignment,
      this.crossAxisAlignment})
      : assert(children != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: mainAxisSize ?? MainAxisSize.max,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment??CrossAxisAlignment.center,
      children: children,
    );
  }
}
