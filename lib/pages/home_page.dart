import 'package:flutter/material.dart';
import 'package:flutter_book_app/pages/interested_in_books.dart';
import 'package:flutter_book_app/pages/new_books.dart';
import 'package:flutter_book_app/utils/style_maker.dart';
import 'package:flutter_book_app/widgets/custom/a_widgets.dart';

import 'not_interested_in_books.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  List<String> pageTitles = [
    'Books you are not interested in',
    'New books',
    'Books you are interested in',
  ];

  List<Widget> _widgetOptions = <Widget>[
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight > screenWidth
            ? screenHeight * .05
            : screenHeight * .08),
        child: AppBar(
          title: AText(
            pageTitles.elementAt(_selectedIndex),
            style: StyleMaker.withSize(context, primary: true),
          ),
        ),
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
