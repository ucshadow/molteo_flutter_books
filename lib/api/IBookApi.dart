import 'package:flutter_book_app/models/Book.dart';

/// Interface to specify the functionality needed by an implementation
/// to be able to function with the app
abstract class IBookApi {

  /// Since different apis return different response formats, this provides
  /// a way to inject a specific template mapping into the Book model
  /// ex: an api may return the book title as name {"name": "Shogun"}
  /// and another may return it as title {"title": "Shogun"}, responseMapping
  /// will declare responseMapping['title'] = json['name'] or
  /// responseMapping['title'] = json['title']
  Map<String, String> responseMapping;

  /// Gets a generic list of books, it does not specify what the books should be
  Future<List<Book>> getBooks();

  /// Gets a list of new books, for example the (new this month)
  /// if using goodreads
  Future<List<Book>> getNewBooks();

  /// Gets a list of books by a specific key and query
  /// ex: get a book list [by] name where name starts with 'a', of course
  /// the implementation is api dependent and may vary
  Future<List<Book>> getBooksBy(String by, String q, int results);

  /// Gets a book by a specific key and query
  /// ex: get a book [by] name where name == 'The constitution', of course
  /// the implementation is api dependent and may vary
  Future<Book> getBookBy(String by, String q);
}