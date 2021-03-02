import 'package:flutter/material.dart';
import 'package:flutter_book_app/bloc/controllers/InterestController.dart';
import 'package:flutter_book_app/pages/home_page.dart';
import 'package:flutter_book_app/utils/global_function_registry.dart';
import 'package:flutter_book_app/utils/user_preferences.dart';

import 'constants/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  ThemeData theme;

  @override
  void initState() {
    theme = darkTheme;
    _setTheme();
    InterestController().init();
    GlobalFunctionRegistry.registerFunction("themeSwitcher", _changeTheme);
    super.initState();
  }

  Future<void> _setTheme() async {
    ThemeData data = await UserPreferences().getThemeData();
    setState(() {
      theme = data;
    });
  }

  _changeTheme(String themeName) async {
    UserPreferences().switchTheme(themeName);
    ThemeData data = await UserPreferences().getThemeData();
    setState(() {
      theme = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: HomePage(),
    );
  }
}
