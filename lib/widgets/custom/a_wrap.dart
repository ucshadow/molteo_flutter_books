import 'package:flutter/material.dart';

class AWrap extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final double runSpacing;
  final WrapAlignment alignment;

  const AWrap(
      {Key key, this.children, this.spacing, this.runSpacing, this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: children,
      spacing: spacing,
      runSpacing: runSpacing,
      alignment: alignment??WrapAlignment.start,
    );
  }
}
