import 'package:flutter/material.dart';
import 'package:flutter_book_app/bloc/controllers/InterestController.dart';
import 'package:flutter_book_app/widgets/custom/a_widgets.dart';

class InterestedInBooks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AListView(
      children: InterestController().interestedInTitles.map((e) {
        return AText(e);
      }).toList(),
    );
  }

}