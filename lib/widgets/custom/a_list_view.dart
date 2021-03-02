import 'package:flutter/material.dart';

class AListView extends StatelessWidget {
  final List<Widget> children;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final Axis scrollDirection;
  final bool shrinkWrap;
  final ScrollPhysics physics;
  final EdgeInsetsGeometry padding;
  final ScrollController controller;

  const AListView(
      {Key key,
      this.children,
      this.itemCount,
      this.itemBuilder,
      this.scrollDirection,
      this.shrinkWrap, this.physics, this.padding, this.controller})
      : super(key: key);

  const AListView.builder(
      {Key key,
      this.children,
      this.itemCount,
      this.itemBuilder,
      this.scrollDirection,
      this.shrinkWrap, this.physics, this.padding, this.controller})
      : assert(itemBuilder != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (itemBuilder == null) {
      return ListView(
        scrollDirection: scrollDirection??Axis.vertical,
        physics: physics,
        shrinkWrap: shrinkWrap??true,
        padding: padding,
        children: children,
        controller: controller,
      );
    } else {
      return ListView.builder(
        scrollDirection: scrollDirection??Axis.vertical,
        shrinkWrap: shrinkWrap??true,
        physics: physics,
        padding: padding,
        itemBuilder: itemBuilder,
        itemCount: itemCount,
        controller: controller,
      );
    }
  }
}
