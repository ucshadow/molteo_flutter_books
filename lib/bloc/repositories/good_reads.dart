import 'package:flutter_book_app/api/IBookApi.dart';
import 'package:flutter_book_app/bloc/controllers/InterestController.dart';
import 'package:flutter_book_app/bloc/controllers/books_controller.dart';
import 'package:flutter_book_app/models/Book.dart';
import 'package:flutter_book_app/models/comment.dart';
import 'package:flutter_book_app/providers/implementationProvider.dart';
import 'package:html/parser.dart' show parse;

class GoodReads implements IBookApi {
  @override
  Map<String, String> responseMapping;
  final String baseUrl = 'https://www.goodreads.com';

  @override
  Future<Book> getBookBy(String by, String q) async {
    final response = await ImplementationProvider.getHttpProvider()
        .get("$baseUrl/book/show/$q", withFakeHeaders: true);
    Book book = await _parseBookFromHtml(response);
    book.comments = await _getComments(response);
    return book;
  }

  @override
  Future<List<Book>> getBooks() {
    // TODO: implement getBooks
    throw UnimplementedError();
  }

  @override
  Future<List<Book>> getBooksBy(String by, String q, int results) async {
    final response = await ImplementationProvider.getHttpProvider()
        .get("$baseUrl/search?q=$q", withFakeHeaders: true);
    return await _htmlResultToBookList(response);
  }

  @override
  Future<List<Book>> getNewBooks() async {
    if(BookController().mostPopularToday.isNotEmpty) {
      return BookController().mostPopularToday.where((book) => !InterestController().notInterestedInTitles.contains(book.title)).toList();
    }
    final response = await ImplementationProvider.getHttpProvider()
        .get("$baseUrl/book/popular_by_date/2021/${DateTime.now().month}", withFakeHeaders: true);
    return await _htmlResultToBookList(response);
  }

  Future<List<Book>> _htmlResultToBookList(response) async {
    var document = parse(response);
    List<Book> books = [];
    document.querySelectorAll("tr").forEach((element) {
      var img = element.querySelector('img').attributes['src'];
      var _title = element.getElementsByClassName('bookTitle')[0];
      var title = element.getElementsByClassName('bookTitle')[0].text;
      var subtitle = element.getElementsByClassName('smallText')[0].text;
      var url = baseUrl + _title.attributes['href'];
      Book b = Book();
      b.title = title;
      b.image = img;
      b.subtitle = subtitle;
      b.url = url;
      BookController().mostPopularToday.add(b);
      books.add(b);
    });
    return books.where((book) => !InterestController().notInterestedInTitles.contains(book.title)).toList();
  }

  Future<Book> _parseBookFromHtml(response) async {
    var element = parse(response);
    var img = element.getElementById('coverImage').attributes['src'];
    var title = element.getElementById('bookTitle').text;
    var description = element.getElementById('description').text;
    var ratings = element.getElementById('bookMeta').text;
    Book b = Book();
    b.title = title;
    b.image = img;
    b.description = description;
    b.ratings = ratings;
    return b;
  }

  Future<List<Comment>> _getComments(response) async {
    var document = parse(response);
    List<Comment> comments = [];
    document.getElementsByClassName('friendReviews').forEach((element) {
      Comment comment = Comment();
      comment.text = element.getElementsByClassName('reviewText')[0].text;
      comment.date = element.getElementsByClassName('reviewDate')[0].text;
      comment.rating = element.getElementsByClassName('notranslate')[0].text;
      comment.author = element.getElementsByClassName('user')[0].text;
      comments.add(comment);
    });
    return comments;
  }
}
