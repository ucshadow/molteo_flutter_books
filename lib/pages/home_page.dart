import 'package:flutter/material.dart';
import 'package:flutter_book_app/pages/interested_in_books.dart';
import 'package:flutter_book_app/pages/new_books.dart';
import 'package:flutter_book_app/widgets/custom/a_widgets.dart';

import 'not_interested_in_books.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  static List<Widget> _widgetOptions = <Widget>[
    NotInterestedInBooks(),
    NewBooks(),
    InterestedInBooks(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AText("Hi"),
      ),
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
        // color: Colors.lightBlue,
      ),
      bottomNavigationBar: BottomAppBar(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: AIcon(Icons.not_interested),
              label: "Not interested",
            ),
            BottomNavigationBarItem(
              icon: AIcon(Icons.new_releases),
              label: 'New books',
            ),
            BottomNavigationBarItem(
              icon: AIcon(Icons.read_more),
              label: "Interested",
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor:
          Theme.of(context).buttonTheme.colorScheme.secondaryVariant,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
