import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_book_app/bloc/blocs/book/book_bloc.dart';
import 'package:flutter_book_app/bloc/events/book/book_events.dart';
import 'package:flutter_book_app/bloc/state/book/book_state.dart';
import 'package:flutter_book_app/models/Book.dart';
import 'package:flutter_book_app/widgets/custom/a_widgets.dart';

import 'book_list.dart';

/// Responsible for displaying a list of [BookListItem]
/// when in landscape mode. The difference from [BookListPortrait] is
/// the width and the tap (on Book widget) functionality
/// [books] the list of [Book] objects
class BookListLandscape extends StatefulWidget {
  final List<Book> books;

  const BookListLandscape({Key key, this.books}) : super(key: key);

  @override
  _BookListLandscapeState createState() => _BookListLandscapeState();
}

class _BookListLandscapeState extends State<BookListLandscape> {
  int selected = 0;

  /// The bloc responsible for emitting events on tap and the initial event
  BookBloc bookBloc;

  @override
  void initState() {
    bookBloc = BookBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return AContainer(
      width: width,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [

          // the book list
          AContainer(
            width: width * .35,
            child: BookList(
              books: widget.books,
              width: width * .35,
              onTapItemCallback: onTapItem,
            ),
          ),

          // the right section (comments)
          Positioned(
            right: 0,
            child: AContainer(
              height: height,
              width: width * .65,
              child: BlocProvider(
                create: (context) => bookBloc
                  ..add(BookEventGetBookByUrl(widget.books[selected].url)),
                child: BlocBuilder<BookBloc, BookState>(
                  builder: (context, state) {
                    return state.render();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// callback for tapping a Book widget in landscape mode
  /// will update the right section with data about the book
  onTapItem(Book book) {
    if(book.url == null) {
      print('${book.title} has no url');
      return;
    }
    bookBloc
      ..add(BookEventGetBookByUrl(book.url));
  }
}
