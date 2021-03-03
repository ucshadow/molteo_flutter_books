abstract class BookEvent {}

/// Searches a book [by] a given key with a given [q] query
/// ex: by = 'name' and q = 'A song of ice and fire'
class BookEventSearchBook extends BookEvent {
  final String by;
  final String q;

  BookEventSearchBook({this.by, this.q});
}

/// Gets a book by isbn
class BookEventGetBookByIsbn extends BookEvent {
  final String isbn;

  BookEventGetBookByIsbn(this.isbn);
}

/// Gets a book by the book's url, for example for good reads, we can get a
/// list of books popular this month and if we want more details about a
/// specific book (including comments) we emit this event with the book url
/// that is provided from the list of most popular books this month
class BookEventGetBookByUrl extends BookEvent {
  final String url;

  BookEventGetBookByUrl(this.url);
}