import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_book_app/api/IBookApi.dart';
import 'package:flutter_book_app/bloc/events/book/book_events.dart';
import 'package:flutter_book_app/bloc/state/book/book_state.dart';
import 'package:flutter_book_app/models/Book.dart';
import 'package:flutter_book_app/providers/implementationProvider.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc() : super(BookStateInitial());
  IBookApi api = ImplementationProvider.getBookApi();

  @override
  Stream<BookState> mapEventToState(BookEvent event) async* {
    if(event is BookEventGetBookByName) {
      yield BookLoading();
      try {
        final List<Book> books = await api.getNewBooks();
        yield BookLoadingSuccess();
      } catch (e) {
        print('Bloc Error BookEventGetNewBooks');
        yield BookLoadingFailed();
      }
    }
  }

}