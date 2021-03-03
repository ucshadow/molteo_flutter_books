import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_book_app/bloc/controllers/InterestController.dart';
import 'package:flutter_book_app/models/Book.dart';
import 'package:flutter_book_app/utils/style_maker.dart';
import 'package:flutter_book_app/widgets/custom/a_widgets.dart';

class BookListItem extends StatefulWidget {
  final Book book;
  final Function removeSelf;
  final int index;
  final double width;

  const BookListItem(
      {Key key, this.book, this.removeSelf, this.index, this.width})
      : super(key: key);

  @override
  _BookListItemState createState() => _BookListItemState();
}

class _BookListItemState extends State<BookListItem> {
  double x = 0.0;

  @override
  Widget build(BuildContext context) {
    double width = widget.width;
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (x > width * .5) {
          setState(() {
            InterestController().interested(widget.book);
          });

          return;
        }
        if (x < -width * .5) {
          InterestController().notInterested(widget.book);
          widget.removeSelf(widget);
          return;
        }
        setState(() {
          x += details.delta.dx;
        });
      },
      onHorizontalDragStart: (details) {
        setState(() {
          x = 0.0;
        });
      },
      onHorizontalDragEnd: (details) {
        setState(() {
          x = 0.0;
        });
      },
      child: AContainer(
        height: StyleMaker.getSize(context, factor: 3),
        child: Stack(
          children: [
            AContainer(
              width: width / 2,
              height: StyleMaker.getSize(context, factor: 3),
              child: ARow(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  APadding(
                    child: AText(
                      "Interested >>",
                      style: StyleMaker.withSize(context, factor: 18),
                    ),
                    padding: EdgeInsets.only(left: 20),
                  ),
                ],
              ),
            ),
            AContainer(
              width: width,
              height: StyleMaker.getSize(context, factor: 3),
              child: ARow(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  APadding(
                    child: AText(
                      "<< Not Interested",
                      style: StyleMaker.withSize(context, factor: 18),
                    ),
                    padding: EdgeInsets.only(right: 20),
                  ),
                ],
              ),
            ),
            Positioned(
              width: width,
              left: x,
              child: AContainer(
                height: StyleMaker.getSize(context, factor: 3),
                child: ACard(
                  child: ARow(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // image
                      AContainer(
                        child: AColumn(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            APadding(
                              padding: EdgeInsets.all(6),
                              child: Material(
                                elevation: 2,
                                child: CachedNetworkImage(
                                  imageUrl: widget.book?.image ??
                                      'https://i.imgur.com/sUFH1Aq.png',
                                  height:
                                      StyleMaker.getSize(context, factor: 3.8),
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    fadeInDuration: Duration(milliseconds: 200),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      AContainer(
                        width: width * 0.66,
                        child: APadding(
                          padding: EdgeInsets.only(right: 20),
                          child: AColumn(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: APadding(
                                  padding: EdgeInsets.only(bottom: 6),
                                  child: AText(
                                    widget.book?.title?.trim(),
                                    textAlign: TextAlign.start,
                                    style: StyleMaker.withSize(context,
                                        factor: 32,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: AText(
                                  widget.book?.subtitle
                                          ?.replaceAll('\n', '')
                                          ?.trim() ??
                                      "",
                                  textAlign: TextAlign.start,
                                  style:
                                      StyleMaker.withSize(context, factor: 36),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            InterestController().isInterestedIn(widget.book.title)
                ? Positioned(
                    child: AIcon(
                      Icons.check,
                      color: Colors.green,
                    ),
                    right: 6,
                    top: 6)
                : Container()
          ],
        ),
      ),
    );
  }
}
