import 'package:flutter_book_app/api/IBookApi.dart';
import 'package:flutter_book_app/models/Book.dart';
import 'package:flutter_book_app/providers/implementationProvider.dart';

class ItBook implements IBookApi {
  @override
  Map<String, String> responseMapping = {
    'title': 'title',
    'subtitle': 'subtitle',
    'isbn': 'isbn13',
    'price': 'price',
    'image': 'image',
    'url': 'url'
  };

  final String baseUrl = "https://api.itbook.store/1.0";

  @override
  Future<Book> getBookBy(String by, String q) async {
    final response = await ImplementationProvider.getHttpProvider()
        .get("$baseUrl/q");
    return Book.fromJson(response, responseMapping);
  }

  @override
  Future<List<Book>> getBooks() {
    // TODO: implement getBooks
    throw UnimplementedError();
  }

  @override
  Future<List<Book>> getNewBooks() async {
    final response = await ImplementationProvider.getHttpProvider()
        .get("$baseUrl/new");
    return Book.listFromJson(response['books'], responseMapping);
  }

  @override
  Future<List<Book>> getBooksBy(String by, String q, int results) {
    // TODO: implement getBooksBy
    throw UnimplementedError();
  }

}