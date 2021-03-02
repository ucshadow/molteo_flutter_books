import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_book_app/bloc/blocs/book/book_list_bloc.dart';
import 'package:flutter_book_app/bloc/events/book/book_list_events.dart';
import 'package:flutter_book_app/bloc/state/book/book_list_state.dart';

class NewBooks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BookListBloc()..add(BookEventGetNewBooks(numberOfBooks: 10)),
      child: BlocBuilder<BookListBloc, BookListState>(
        builder: (context, state) {
          return state.render();
        },
      ),
    );
  }
}
