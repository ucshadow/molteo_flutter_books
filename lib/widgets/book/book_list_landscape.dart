import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_book_app/bloc/blocs/book/book_list_bloc.dart';
import 'package:flutter_book_app/models/Book.dart';
import 'package:flutter_book_app/widgets/custom/a_widgets.dart';

class BookListLandscape extends StatefulWidget {
  final List<Book> books;

  const BookListLandscape({Key key, this.books}) : super(key: key);

  @override
  _BookListLandscapeState createState() => _BookListLandscapeState();
}

class _BookListLandscapeState extends State<BookListLandscape> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return AContainer(
      width: width,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          AContainer(
            width: width * .25,
            child: AListView.builder(
              itemCount: widget.books.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = index;
                    });
                  },
                  child: AContainer(
                    height: height * .5,
                    child: APadding(
                      child: Image.network(
                        widget.books[index].image,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                );
              }
            ),
          ),
          Positioned(
            right: 0,
            child: AContainer(
              showBg: true,
              height: height,
              width: width * .75,
          ),),
        ],
      ),
    );
  }
}
