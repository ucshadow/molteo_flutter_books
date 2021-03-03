import 'package:flutter/material.dart';
import 'package:flutter_book_app/models/Book.dart';
import 'package:flutter_book_app/widgets/book/detailed_book.dart';
import 'package:flutter_book_app/widgets/custom/a_widgets.dart';


/// Handles the state a book can be in at any given time
class BookState {
  Widget render() {
    return Container();
  }
}

class BookStateInitial extends BookState {
  Widget render() {
    return Container();
  }
}

class BookLoading extends BookState {
  Widget render() {
    return ACenter(
      child: LinearProgressIndicator(),
    );
  }
}

class BookLoadingSuccess extends BookState {
  final Book book;

  BookLoadingSuccess(this.book);

  Widget render() {
    return DetailedBook(book: book,);
  }
}

class BookLoadingFailed extends BookState {
  final String message;

  BookLoadingFailed({this.message});
  Widget render() {
    return ACenter(
      child: AText(message??"An error occurred while loading the book"),
    );
  }
}