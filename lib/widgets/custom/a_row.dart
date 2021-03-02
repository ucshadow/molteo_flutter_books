import 'package:flutter/material.dart';

class ARow extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const ARow({Key key, this.mainAxisAlignment, this.children, this.crossAxisAlignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: children,
      mainAxisAlignment: mainAxisAlignment??MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment??CrossAxisAlignment.start,
    );
  }
}
