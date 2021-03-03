import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_book_app/models/Book.dart';
import 'package:flutter_book_app/models/comment.dart';
import 'package:flutter_book_app/widgets/custom/a_widgets.dart';

class DetailedBook extends StatelessWidget {
  final Book book;

  const DetailedBook({Key key, this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        // image
        AContainer(
          height: height * .7,
          child: CachedNetworkImage(
            imageUrl: book.image,
            height: height * .5,
          ),
        ),
        APadding(
          padding: EdgeInsets.only(left: width * 0.3, right: 12),
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
                        ARow(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AText(e.date),
                            AText(e.author),
                            AText(e.rating)
                          ],
                        ),
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
