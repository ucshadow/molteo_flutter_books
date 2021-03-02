import 'package:flutter_book_app/models/Book.dart';

abstract class IBookApi {
  Map<String, String> responseMapping;
  Future<List<Book>> getBooks();
  Future<List<Book>> getNewBooks();
  Future<List<Book>> getBooksBy(String by, String q, int results);
  Future<Book> getBookBy(String by, String q);
}