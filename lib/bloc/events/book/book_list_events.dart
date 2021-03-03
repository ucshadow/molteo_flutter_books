abstract class BookListEvent {}

/// Gets a list of books, can be conditioned to return only a certain number
class BookEventGetNewBooks extends BookListEvent {
  final int numberOfBooks;

  BookEventGetNewBooks({this.numberOfBooks});
}

/// Gets a list of favorite books, can be conditioned to return only a certain number
class GetFavoriteBooks extends BookListEvent {
  final int numberOfBooks;

  GetFavoriteBooks({this.numberOfBooks});
}