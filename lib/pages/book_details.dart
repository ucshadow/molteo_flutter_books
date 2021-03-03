import 'package:flutter/material.dart';
import 'package:flutter_book_app/models/Book.dart';
import 'package:flutter_book_app/utils/style_maker.dart';
import 'package:flutter_book_app/widgets/custom/a_widgets.dart';

class BookDetails extends StatelessWidget {
  final Book book;

  const BookDetails({Key key, this.book}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AText(book.title?.trim()??"Book details", style: StyleMaker.withSize(context, primary: true),),
      ),
      body: AColumn(
        children: [
          AText(book.ratings, style: StyleMaker.withSize(context),),
          AText(book.subtitle, style: StyleMaker.withSize(context),),
          AText(book.description, style: StyleMaker.withSize(context),),
        ],
      ),
    );
  }

}