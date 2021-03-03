import 'package:flutter/material.dart';
import 'package:flutter_book_app/models/Book.dart';
import 'package:flutter_book_app/widgets/book/book_list_item.dart';

class BookList extends StatefulWidget {
  final List<Book> books;
  final double width;
  final Function onTapItemCallback;

  const BookList({Key key, this.books, this.width, this.onTapItemCallback})
      : super(key: key);

  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  GlobalKey<AnimatedListState> _listKey = GlobalKey();
  List<BookListItem> books = [];
  int offset = 0;

  @override
  void initState() {

    // animate the populating of the list
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var future = Future(() {});
      for (var i = 0; i < widget.books.length; i++) {
        future = future.then((_) {
          return Future.delayed(Duration(milliseconds: 100), () {
            _addItem(BookListItem(
              book: widget.books[i],
              width: widget.width,
              removeSelf: _removeBook,
              onTapCallback: widget.onTapItemCallback,
            ));
          });
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      initialItemCount: books.length,
      itemBuilder: (context, index, animation) {
        return SlideTransition(
          position: CurvedAnimation(
            curve: Curves.easeOut,
            parent: animation,
          ).drive((Tween<Offset>(
            begin: Offset(1, 0),
            end: Offset(0, 0),
          ))),
          child: books[index],
        );
      },
    );
  }

  Widget _buildItem(BookListItem book, Animation animation, int index) {
    return FadeTransition(
      opacity: animation,
      // sizeFactor: animation,
      child: book,
    );
  }

  Widget _buildItemWithTransition(
      BookListItem book, Animation animation, int index, bool slideToRight) {
    return SlideTransition(
      position: CurvedAnimation(
        curve: Curves.easeOut,
        parent: animation,
      ).drive((Tween<Offset>(
        begin: Offset(slideToRight ? 1 : 0, 0),
        end: Offset(slideToRight ? 0 : 1, 0),
      ))),
      child: book,
    );
  }

  void _removeBook(BookListItem item) {
    for (int i = 0; i < books.length; i++) {
      if (books[i] == item) {
        return _removeItem(i);
      }
    }
  }

  void _removeItem(int index) {
    BookListItem book = books.removeAt(index);
    AnimatedListRemovedItemBuilder builder = (context, animation) {
      // A method to build the Card widget.
      return _buildItem(book, animation, index);
    };
    _listKey.currentState.removeItem(index, builder);
  }

  void _addItem(BookListItem book) {
    if (!mounted) return;
    final int _index = books.length;
    books.insert(_index, book);
    _listKey.currentState
        .insertItem(_index, duration: Duration(milliseconds: 100));
  }
}
