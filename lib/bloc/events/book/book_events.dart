abstract class BookEvent {}

class BookEventSearchBook extends BookEvent {
  final String by;
  final String q;

  BookEventSearchBook({this.by, this.q});
}

class BookEventGetBookByIsbn extends BookEvent {
  final String isbn;

  BookEventGetBookByIsbn(this.isbn);
}

class BookEventGetBookByUrl extends BookEvent {
  final String url;

  BookEventGetBookByUrl(this.url);
}