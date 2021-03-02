import 'package:flutter_book_app/api/IBookApi.dart';
import 'package:flutter_book_app/models/Book.dart';
import 'package:flutter_book_app/providers/implementationProvider.dart';

class OpenLibrary implements IBookApi {
  @override
  Map<String, String> responseMapping = {
    'title': 'title',
    'subtitle': 'title_suggest',
    'isbn': 'isbn',
    'price': 'price',
    'image': 'cover_i',
    'url': 'key'
  };

  final String baseUrl = 'http://openlibrary.org';

  @override
  Future<Book> getBookBy(String by, String q) {
    // TODO: implement getBookBy
    throw UnimplementedError();
  }

  @override
  Future<List<Book>> getBooks() {
    // TODO: implement getBooks
    throw UnimplementedError();
  }

  @override
  Future<List<Book>> getNewBooks() async {
    final response = await ImplementationProvider.getHttpProvider()
        .get("$baseUrl/search.json?title=programming&limit=10&page=9000");
    List<Book> books = [];
    (response['docs'] as List<dynamic>).forEach((element) {
      print(element['key']);
      print(element['cover_i']);
    });
    print(response['docs']);
    return Book.listFromJson(response['docs'].map((e) {
      e['key'] = 'https://openlibrary.org/${e['key']}';
      e['cover_i'] = 'https://covers.openlibrary.org/b/id/${e['key']}.jpg';
    }).toList(), responseMapping);
  }

  @override
  Future<List<Book>> getBooksBy(String by, String q, int results) async {
    final response = await ImplementationProvider.getHttpProvider()
        .get("$baseUrl/search.json?q=$by:$q&limit=$results");
    return Book.listFromJson(response['docs'].map((e) {
      e['key'] = 'https://openlibrary.org/${e['key']}';
      e['cover_i'] = e['key'] == 'https://covers.openlibrary.org/b/id/${e['key']}.jpg';
    }).toList(), responseMapping);
  }
}
