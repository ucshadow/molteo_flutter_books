import 'package:flutter/material.dart';

import 'a_icon.dart';

class AButton extends StatelessWidget {
  final Function onPressed;
  final Widget label;
  final Widget icon;
  final Color color;
  final EdgeInsetsGeometry padding;
  final double minWidth;
  final ShapeBorder shape;
  final double elevation;

  const AButton(
      {Key key,
      this.onPressed,
      this.label,
      this.icon,
      this.color,
      this.padding, this.minWidth, this.shape, this.elevation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (icon == null) {
      return ButtonTheme(
        shape: shape,
        minWidth: minWidth??88.0,
        child: RaisedButton(
          textColor: Theme.of(context).secondaryHeaderColor,
          child: this.label,
          color: color ?? Theme.of(context).accentColor,
          onPressed: this.onPressed,
          padding: padding,
          elevation: elevation??4,
        ),
      );
    }
    return ButtonTheme(
      minWidth: minWidth??88.0,
      child: RaisedButton.icon(
        textColor: Theme.of(context).secondaryHeaderColor,
        label: this.label,
        color: color ?? Theme.of(context).buttonTheme.colorScheme.primary,
        onPressed: this.onPressed,
        icon: icon,
        padding: padding,
        elevation: elevation??4,
      ),
    );
  }
}
