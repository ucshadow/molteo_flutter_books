import 'package:flutter/material.dart';
import 'package:flutter_book_app/models/Book.dart';
import 'package:flutter_book_app/widgets/book/book_list.dart';
import 'package:flutter_book_app/widgets/book/book_list_landscape.dart';
import 'package:flutter_book_app/widgets/custom/a_widgets.dart';

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
                    ? BookList(
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
