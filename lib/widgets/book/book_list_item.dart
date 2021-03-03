import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_book_app/bloc/controllers/InterestController.dart';
import 'package:flutter_book_app/models/Book.dart';
import 'package:flutter_book_app/utils/style_maker.dart';
import 'package:flutter_book_app/widgets/custom/a_widgets.dart';


/// Widget representing a book card in a list of books cards
/// [book] the Book model
/// [removeSelf] callback for removing the item from the list
/// [onTapCallback] callback for tapping the Widget
/// [index] the index of the Widget in the list
/// [width] the width of the Widget, it is different based on
/// the screen orientation
class BookListItem extends StatefulWidget {
  final Book book;
  final Function removeSelf;
  final Function onTapCallback;
  final int index;
  final double width;

  const BookListItem(
      {Key key,
      this.book,
      this.removeSelf,
      this.index,
      this.width,
      this.onTapCallback})
      : super(key: key);

  @override
  _BookListItemState createState() => _BookListItemState();
}

class _BookListItemState extends State<BookListItem> {
  double x = 0.0;

  @override
  Widget build(BuildContext context) {
    double width = widget.width;

    // slide handler (will decide between interested and not interested)
    // based on the slide direction
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

      // callback for tapping a book card, depending of landscape / portrait
      // mode, the tap has a different function. The callback is provided
      // by the parent widget, which in turn is provided by the parent widget.
      child: GestureDetector(
        onTap: () {
          if(widget.onTapCallback != null) {
            return widget.onTapCallback(widget.book);
          }
          print('No callback provided');
        },
        child: AContainer(
          height: StyleMaker.getSize(context, factor: 3),
          child: Stack(
            children: [

              // the interested text behind the card
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

              // the  not interested behind the card
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

              // The book card
              Positioned(
                width: width,
                left: x,
                child: AContainer(
                  height: StyleMaker.getSize(context, factor: 2.8),
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
                                    height: StyleMaker.getSize(context,
                                        factor: 3.8),
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    fadeInDuration: Duration(milliseconds: 200),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // card text
                        AContainer(
                          width: width * 0.66,
                          child: APadding(
                            padding: EdgeInsets.only(right: 20),
                            child: Stack(
                              children: [

                                // title
                                AText(
                                  widget.book?.title?.trim(),
                                  textAlign: TextAlign.start,
                                  style: StyleMaker.withSize(context,
                                      factor: 32, fontWeight: FontWeight.bold),
                                ),

                                // any other text (description / subtitle)
                                APadding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: AText(
                                    widget.book?.subtitle
                                            ?.trim()
                                            ?.replaceAll('\n', '') ??
                                        "",
                                    textAlign: TextAlign.start,
                                    style: StyleMaker.withSize(context,
                                        factor: 36),
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

              // check mark for when a book is marked as
              // interested in by the user
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
      ),
    );
  }
}
