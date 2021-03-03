import 'package:flutter_book_app/models/Book.dart';

class BookController {
  static final BookController _singleton = BookController._internal();
  Set<Book> _mostPopularToday = Set();
  Set<Book> _interestedIn = Set();
  Set<Book> _notInterestedIn = Set();
  Set<Book> _detailedBooks = Set();

  factory BookController() {
    return _singleton;
  }

  removeBook(Book book) {
    for(Book a in _mostPopularToday) {
      if(book.title == a.title) {
        _mostPopularToday.remove(a);
      }
    }
  }

  addManyMostPopularToday(List<Book> books) {
    _mostPopularToday.addAll(books);
  }

  clear() {
    _mostPopularToday = Set();
    _interestedIn = Set();
    _notInterestedIn = Set();
    _detailedBooks = Set();
  }

  getDetailedBookByUrl(String url) {
    print("Provided url is $url");
    for(Book book in _detailedBooks) {
      if(book.url?.trim() == url?.trim()) {
        return book;
      }
    }
    return null;
  }

  addDetailedBook(Book book) {
    Book b = _mostPopularToday.firstWhere((element) => element.title == book.title, orElse: () => null);
    if(b != null) {
      print("Already there with ${b.url}");
      b.image = book.image;
    }
    _detailedBooks.add(book);
    print("Added ${book.title}, ${book.url}");
  }

  BookController._internal();

  get mostPopularToday => _mostPopularToday.toList();
  get interestedIn => _interestedIn.toList();
  get notInterestedIn => _notInterestedIn.toList();
  get detailedBooks => _detailedBooks.toList();
}