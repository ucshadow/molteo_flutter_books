import 'package:flutter/material.dart';
import 'package:flutter_book_app/constants/themes.dart';
import 'package:flutter_book_app/models/Book.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _singleton = UserPreferences._internal();

  String selectedTheme = "Dark";
  Map<String, ThemeData> themes = {
    "Light": themeData,
    "Dark": darkTheme,
  };

  void init() async {
    final prefs = await SharedPreferences.getInstance();
    selectedTheme = prefs.containsKey("selectedTheme") ? prefs.getString("selectedTheme") : "Light";
  }

  Future<ThemeData> getThemeData() async {
    final prefs = await SharedPreferences.getInstance();
    String themName = prefs.containsKey("selectedTheme") ? prefs.getString("selectedTheme") : "Light";
    if(themes.containsKey(themName)) {
      return themes[themName];
    }
    return themes["Light"];
  }

  Future<void> switchTheme(String name) async {
    if(!themes.containsKey(name)) return;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("selectedTheme", name);
  }

  Future<void> saveBookToInterested(Book book) async {
    final prefs = await SharedPreferences.getInstance();
    var interested = prefs.getStringList('interested');
    if(interested != null) {
      if(!interested.contains(book.title)) {
        interested.add(book.title);
        prefs.setStringList('interested', interested);
      }
    } else {
      prefs.setStringList('interested', [book.title]);
    }
    removeBookFromNotInterested(book);
  }

  Future<void> saveBookToNotInterested(Book book) async {
    final prefs = await SharedPreferences.getInstance();
    var notInterested = prefs.getStringList('notInterested');
    if(notInterested != null) {
      if(!notInterested.contains(book.title)) {
        notInterested.add(book.title);
        prefs.setStringList('notInterested', notInterested);
      }
    } else {
      prefs.setStringList('notInterested', [book.title]);
    }
    removeBookFromInterested(book);
  }

  Future<void> removeBookFromNotInterested(Book book) async {
    final prefs = await SharedPreferences.getInstance();
    var notInterested = prefs.getStringList('notInterested');
    if(notInterested == null) {
      return;
    } else {
      notInterested.remove(book.title);
      prefs.setStringList('notInterested', notInterested);
    }
  }

  Future<void> removeBookFromInterested(Book book) async {
    final prefs = await SharedPreferences.getInstance();
    var interested = prefs.getStringList('interested');
    if(interested != null) {
      interested.remove(book.title);
      prefs.setStringList('interested', interested);
    }
  }

  // there is no good way to use shared preferences to work with what I need
  // but for the demo's sake, I will not use sqlite
  Future<Map<String, List<String>>> getBookData() async {
    final prefs = await SharedPreferences.getInstance();
    var notInterested = prefs.getStringList('notInterested');
    var interested = prefs.getStringList('interested');
    Map<String, List<String>> res = {};
    res['interested'] = interested;
    res['notInterested'] = notInterested;
    print('Interested length: ${interested?.length}');
    print('not interested length: ${interested?.length}');
    return res;
  }

  factory UserPreferences() {
    return _singleton;
  }

  UserPreferences._internal();
}
