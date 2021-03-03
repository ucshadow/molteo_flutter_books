import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_book_app/api/IBookApi.dart';
import 'package:flutter_book_app/bloc/events/book/book_events.dart';
import 'package:flutter_book_app/bloc/state/book/book_state.dart';
import 'package:flutter_book_app/models/Book.dart';
import 'package:flutter_book_app/providers/implementationProvider.dart';


/// Bloc that handles events/state specific to a single book
///
/// [BookEventGetBookByUrl] event
class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc() : super(BookStateInitial());
  IBookApi api = ImplementationProvider.getBookApi();

  @override
  Stream<BookState> mapEventToState(BookEvent event) async* {
    if(event is BookEventGetBookByUrl) {
      yield BookLoading();
      try {
        final Book book = await api.getBookBy('url', event.url);
        yield BookLoadingSuccess(book);
      } catch (e) {
        print('Bloc Error BookEventGetBookByUrl');
        print(e);
        yield BookLoadingFailed(message: e);
      }
    }
  }

}