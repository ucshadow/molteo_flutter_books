import 'package:flutter_book_app/models/Book.dart';

class BookController {
  static final BookController _singleton = BookController._internal();
  List<Book> mostPopularToday = [];
  List<Book> interestedIn = [];
  List<Book> notInterestedIn = [];

  factory BookController() {
    return _singleton;
  }

  removeBook(Book book) {
    for(Book a in mostPopularToday) {
      if(book.title == a.title) {
        mostPopularToday.remove(a);
      }
    }
  }

  clear() {
    mostPopularToday = [];
    interestedIn = [];
    notInterestedIn = [];
  }

  BookController._internal();
}