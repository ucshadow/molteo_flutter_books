import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_book_app/bloc/blocs/book/book_bloc.dart';
import 'package:flutter_book_app/bloc/events/book/book_events.dart';
import 'package:flutter_book_app/bloc/state/book/book_state.dart';
import 'package:flutter_book_app/models/Book.dart';
import 'package:flutter_book_app/widgets/custom/a_widgets.dart';

class BookListLandscape extends StatefulWidget {
  final List<Book> books;

  const BookListLandscape({Key key, this.books}) : super(key: key);

  @override
  _BookListLandscapeState createState() => _BookListLandscapeState();
}

class _BookListLandscapeState extends State<BookListLandscape> {
  int selected = 0;
  BookBloc bookBloc;

  @override
  void initState() {
    bookBloc = BookBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return AContainer(
      width: width,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          AContainer(
            width: width * .25,
            child: AListView.builder(
              itemCount: widget.books.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print(widget.books[index].url);
                    setState(() {
                      selected = index;
                      bookBloc.add(BookEventGetBookByUrl(widget.books[selected].url));
                    });
                  },
                  child: AContainer(
                    height: height * .5,
                    child: APadding(
                      child: CachedNetworkImage(
                        imageUrl: widget.books[index].image ??
                            'https://i.imgur.com/sUFH1Aq.png',
                        fit: BoxFit.fitHeight,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        fadeInDuration: Duration(milliseconds: 500),
                      ),
                    ),
                  ),
                );
              }
            ),
          ),
          Positioned(
            right: 0,
            child: AContainer(
              height: height,
              width: width * .75,
              child: BlocProvider(
                create: (context) =>
                bookBloc..add(BookEventGetBookByUrl(widget.books[selected].url)),
                child: BlocBuilder<BookBloc, BookState>(
                  builder: (context, state) {
                    return state.render();
                  },
                ),
              ),
          ),),
        ],
      ),
    );
  }
}
