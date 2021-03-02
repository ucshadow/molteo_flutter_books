import 'package:flutter_book_app/models/Book.dart';
import 'package:flutter_book_app/utils/user_preferences.dart';

import 'books_controller.dart';

class InterestController {
  static final InterestController _singleton = InterestController._internal();
  Set<String> interestedInTitles = new Set();
  Set<String> notInterestedInTitles = new Set();

  factory InterestController() {
    return _singleton;
  }

  void init() async {
    await getLocalBookData().then((value) {
      notInterestedInTitles = (value['notInterested']??[]).toSet();
      interestedInTitles = (value['interested']??[]).toSet();
    });
  }

  interested(Book book) {
    BookController().interestedIn.add(book);
    BookController().notInterestedIn.remove(book);
    interestedInTitles.add(book.title);
    notInterestedInTitles.remove(book.title);
    UserPreferences().saveBookToInterested(book);
  }

  notInterested(Book book) {
    BookController().notInterestedIn.add(book);
    BookController().interestedIn.remove(book);
    notInterestedInTitles.add(book.title);
    interestedInTitles.remove(book.title);
    UserPreferences().saveBookToNotInterested(book);
  }

  Future<Map<String, List<String>>> getLocalBookData() async {
    return UserPreferences().getBookData();
  }

  bool isInterestedIn(String title) {
    return interestedInTitles.contains(title);
  }


  InterestController._internal();
}