import 'package:flutter/material.dart';
import 'package:flutter_book_app/models/Book.dart';
import 'package:flutter_book_app/pages/book_details.dart';
import 'package:flutter_book_app/widgets/book/book_list.dart';

/// Responsible for displaying a list of [BookListItem]
/// when in portrait mode. The difference from [BookListLandscape] is
/// the width and the tap (on Book widget) functionality
/// [books] the list of [Book] objects
class BookListPortrait extends StatefulWidget {
  final List<Book> books;

  const BookListPortrait({Key key, this.books}) : super(key: key);

  @override
  _BookListPortraitState createState() => _BookListPortraitState();
}

class _BookListPortraitState extends State<BookListPortrait> {
  @override
  Widget build(BuildContext context) {
    return BookList(
      width: MediaQuery.of(context).size.width,
      books: widget.books,
      onTapItemCallback: onTapItem,
    );
  }

  /// callback for tapping a Book widget in portrait mode
  /// will open a new page with the book's details
  onTapItem(Book book) {
    print(book.title);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetails(book: book,)
      ),
    );
  }
}