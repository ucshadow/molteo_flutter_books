import 'package:flutter/cupertino.dart';
import 'package:flutter_book_app/models/comment.dart';

class Book {
  String title;
  String subtitle;
  String isbn;
  dynamic price;
  String image;
  String url;
  String description;
  String ratings;
  bool interestedIn = false;

  // this will only be available from goodreads, I will not implement it any further
  // from lack of time
  List<Comment> comments;

  static Book fromJson(Map<String, dynamic> json, Map<String, dynamic> representation) {
    if (json == null) return null;
    Book book = new Book();
    book.title = json[representation['title']];
    book.subtitle = json[representation['subtitle']];
    book.isbn = json[representation['isbn']];
    book.price = json[representation['price']];
    book.image = json[representation['image']];
    book.url = json[representation['url']];
    book.description = json[representation['description']];
    book.ratings = json[representation['ratings']];
    return book;
  }

  static List<Book> listFromJson(List<dynamic> json, Map<String, dynamic> representation) {
    return json == null
        ? List<Book>()
        : json.map((value) => Book.fromJson(value, representation)).toList();
  }

  bool operator == (o) => o is Book && title == o.title;
  int get hashCode => hashValues(title, 31);
}