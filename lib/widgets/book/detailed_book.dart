import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_book_app/models/Book.dart';
import 'package:flutter_book_app/widgets/custom/a_widgets.dart';


/// Responsible for showing details about a book when in landscape mode
///
/// [book] the current selected (focused) [Book] object
class DetailedBook extends StatelessWidget {
  final Book book;

  const DetailedBook({Key key, this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.topLeft,
      children: [

        // image
        AContainer(
          width: width * 0.26,
          height: MediaQuery.of(context).size.height - 56 * 2, // ~ app bar - nav bar
          child: CachedNetworkImage(
            imageUrl: book.image,
            fit: BoxFit.fitHeight,
          ),
        ),

        // other content (in the current iteration it shows the comments from
        // goodreads, but it can be adapted to show other forms of content)
        APadding(
          padding: EdgeInsets.only(left: width * 0.26, right: 12),
          child: AListView(
            children: book.comments.map((e) {
              return APadding(
                child: AContainer(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1.0, color: Theme.of(context).accentColor),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: APadding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        AText(e.date),
                        AText(e.author),
                        AText(e.rating),
                        AText(e.text),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
