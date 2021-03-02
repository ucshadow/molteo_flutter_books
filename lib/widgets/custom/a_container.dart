import 'package:flutter/material.dart';
import 'package:flutter_book_app/utils/style_maker.dart';

class AContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Decoration decoration;
  final double height;
  final double width;
  final EdgeInsets margin;
  final Alignment alignment;
  final bool showBg;

  const AContainer(
      {Key key,
      this.child,
      this.padding,
      this.decoration,
      this.height,
      this.width, this.margin, this.alignment, this.showBg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _getDecoration(),
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      alignment: alignment,
      child: child,
    );
  }

  BoxDecoration _getDecoration() {
    if(decoration != null) {
      return decoration;
    }
    if(showBg != null && showBg) {
      return _boxDecoration();
    }
    return null;
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: StyleMaker.randomColor()
    );
  }
}
