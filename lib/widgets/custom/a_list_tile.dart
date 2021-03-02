import 'package:flutter/material.dart';

class AListTile extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget subtitle;

  const AListTile({Key key, this.leading, this.title, this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: title,
      subtitle: subtitle,
    );
  }
}
