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

class BookEventGetBookByName extends BookEvent {
  final String name;

  BookEventGetBookByName(this.name);
}