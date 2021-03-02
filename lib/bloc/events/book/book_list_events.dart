abstract class BookListEvent {}

class BookEventGetNewBooks extends BookListEvent {
  final int numberOfBooks;

  BookEventGetNewBooks({this.numberOfBooks});
}

class GetFavoriteBooks extends BookListEvent {
  final int numberOfBooks;

  GetFavoriteBooks({this.numberOfBooks});
}