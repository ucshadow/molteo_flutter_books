import 'package:flutter_book_app/models/Book.dart';
import 'package:flutter_book_app/utils/user_preferences.dart';

import 'books_controller.dart';


/// Handles juggling through different lists of books (interested in /
/// not interested in).
/// The difference between this class and [BookController] is that
/// this class is used for the local saved books (shared preferences).
/// Since it would have been to much to save the whole book in shared
/// preferences and it would have been too much (maybe) to add sqlite to the
/// app, I only saved book titles an wrote this class to bridge the gap
/// between real book objects and the book titles saved locally.
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