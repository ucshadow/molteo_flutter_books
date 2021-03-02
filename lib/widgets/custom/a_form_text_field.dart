import 'package:flutter/material.dart';
import 'package:flutter_book_app/utils/style_maker.dart';

class AFormTextField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;
  final String initialValue;
  final TextStyle hintStyle;
  final TextInputType keyboardType;
  final int minLines;
  final int maxLines;
  final TextEditingController controller;
  final bool enabled;
  final Function onChanged;
  final TextStyle textStyle;
  final InputDecoration decoration;
  final EdgeInsets padding;
  final EdgeInsets contentPadding;

  AFormTextField({
    this.hintText,
    this.validator,
    this.onSaved,
    this.isPassword = false,
    this.isEmail = false,
    this.initialValue,
    this.hintStyle,
    this.keyboardType,
    this.minLines,
    this.maxLines,
    this.controller,
    this.enabled,
    this.onChanged,
    this.textStyle,
    this.decoration,
    this.padding,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: decoration ??
            InputDecoration(
              hintText: hintText,
              hintMaxLines: 10,
              hintStyle: hintStyle ?? StyleMaker.withSize(context),
              contentPadding: contentPadding??EdgeInsets.all(15.0),
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.grey[200],
            ),
        obscureText: isPassword ? true : false,
        style: textStyle ?? StyleMaker.withSize(context),
        validator: validator,
        minLines: minLines ?? 1,
        maxLines: maxLines ?? 1,
        initialValue: this.initialValue,
        onSaved: onSaved,
        enabled: this.enabled ?? true,
        controller: controller,
        onChanged: onChanged,
        keyboardType: isEmail
            ? TextInputType.emailAddress
            : keyboardType ?? TextInputType.text,
      ),
    );
  }
}
