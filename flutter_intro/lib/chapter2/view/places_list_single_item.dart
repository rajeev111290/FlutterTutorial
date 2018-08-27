import 'package:flutter/material.dart';
import 'package:flutter_intro/chapter2/model/places.dart' as places;

class PlaceWidget extends StatelessWidget {
  PlaceWidget(this.place);

  final places.Place place;

  @override
  Widget build(BuildContext context) {
    Color ratingColor = Colors.green[800];
    if (place.rating < 2) {
      ratingColor = Colors.green[100];
    } else if (place.rating < 4) {
      ratingColor = Colors.green[400];
    }

    return new ListTile(
      leading: Image.network(
        place.icon,
        height: 40.0,
        width: 40.0,
      ),
//      new CircleAvatar(
//        child: new Text(place.rating.toString()),
//        backgroundColor: ratingColor,
//      ),
      title: new Text(place.name),
      subtitle: new Text(place.address ?? "unknown ..."),
      isThreeLine: false,
    );
  }
}
