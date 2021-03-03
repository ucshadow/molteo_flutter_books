import 'package:flutter/material.dart';
import 'package:flutter_book_app/models/Book.dart';
import 'package:flutter_book_app/widgets/book/book_list_landscape.dart';
import 'package:flutter_book_app/widgets/book/book_list_portrait.dart';
import 'package:flutter_book_app/widgets/custom/a_widgets.dart';

/* I have chosen to delegate the 'rendering' of the state to the state
itself since it reduces by a lot the 'if' check in the components
ex
  (if state == BookListInitial) {return ...}
  (if state == BookListNoBooks) {return ...}
  (if state == BookListLoading) {return ...}

The disadvantage is that to change the state of the parent, a reference to the
state altering method needs to be provided (the same is true for accessing any
attribute / method from the parent class including the context),
but I have found that the disadvantage is
far lower then the advantage (de-cluttering of code and separation of concerns)
where now in a widget that relies on state provided by the bloc, a simple
state.render() call is enough. This could be further delegated to multiple
files per implementation, where it is far easier to change a file responsible
for a state than changing the Widget code directly.

*/

/// Handles the state a list of books can be in at any given time
class BookListState {
  Widget render() {
    return AContainer();
  }
}

class BookListInitial extends BookListState {}

class BookListNoBooks extends BookListState {}

class BookListLoading extends BookListState {
  @override
  Widget render() {
    return AContainer(
      height: 4,
      child: LinearProgressIndicator(),
    );
  }
}

class BookListLoadingSuccess extends BookListState {
  final List<Book> books;

  BookListLoadingSuccess(this.books);

  @override
  Widget render() {
    return books == null
        ? ACenter(
            child: AText('No books loaded'),
          )
        : AContainer(
            child: OrientationBuilder(
              builder: (context, orientation) {
                return orientation == Orientation.portrait
                    ? BookListPortrait(
                        books: books,
                      )
                    : BookListLandscape(
                        books: books,
                      );
              },
            ),
          );
  }
}

class BookListLoadingFailed extends BookListState {
  final String errorMessage;

  BookListLoadingFailed({this.errorMessage});

  @override
  Widget render() {
    return ACenter(
      child: AText(errorMessage ?? "An error has occurred"),
    );
  }
}
