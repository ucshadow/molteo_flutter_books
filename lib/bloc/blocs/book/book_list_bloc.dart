import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_book_app/api/IBookApi.dart';
import 'package:flutter_book_app/bloc/events/book/book_list_events.dart';
import 'package:flutter_book_app/bloc/state/book/book_list_state.dart';
import 'package:flutter_book_app/models/Book.dart';
import 'package:flutter_book_app/providers/implementationProvider.dart';

class BookListBloc extends Bloc<BookListEvent, BookListState> {
  BookListBloc() : super(BookListInitial());
  IBookApi api = ImplementationProvider.getBookApi();

  @override
  Stream<BookListState> mapEventToState(BookListEvent event) async* {
    if(event is BookEventGetNewBooks) {
      yield BookListLoading();
      try {
        final List<Book> books = await api.getNewBooks();
        yield BookListLoadingSuccess(books);
      } catch (e) {
        print('Bloc Error BookEventGetNewBooks');
        print(e);
        yield BookListLoadingFailed(errorMessage: e.toString());
      }
    }
  }

}