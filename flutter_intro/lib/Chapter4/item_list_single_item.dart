import 'package:flutter/material.dart';
import 'package:flutter_intro/Chapter4/models/item_model.dart';
import 'package:flutter_intro/chapter3/utils/colors.dart';
import 'package:flutter_intro/chapter3/utils/ui_utils.dart';

class NewsWidget extends StatelessWidget {
  NewsWidget(this.itemModel);

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    Color ratingColor = Colors.green[800];
    if (itemModel.score < 2) {
      ratingColor = Colors.green[100];
    } else if (itemModel.score < 4) {
      ratingColor = Colors.green[400];
    }

    debugPrint("Type: ${itemModel.score} ~ by: ${itemModel.by}");


    return new ListTile(
      leading: new CircleAvatar(
        child: new Text(itemModel.score.toString()),
        backgroundColor: ratingColor,
      ),
      title: textH3(itemModel.title,1),
      subtitle:
      Text(
        "Type: ${itemModel.type} ~ by: ${itemModel.by}"?? "unknown ...",
        maxLines: 1,
        style: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
            color: grey3,
            fontFamily: NUNITOSANS_FONT,
            fontSize: 14.0),
      ),
      isThreeLine: false,
    );
  }
}
