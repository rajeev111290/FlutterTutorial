import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_intro/chapter2/model/places.dart' as places;
import 'package:flutter_intro/chapter2/presenter/places_presenter.dart';
import 'package:flutter_intro/chapter2/view/places_list_single_item.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({Key key, this.title}) : super(key: key);

  final String title;
  final String searchKey = 'restaurant';

  @override
  _ResultScreenState createState() => new _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  StreamController<places.Place> placesStreamController;
  List<places.Place> placeList;

  _getPlaces(double lat, double lng) {
    placesStreamController = new StreamController<places.Place>.broadcast();
    placesStreamController.stream
        .listen((place) => setState(() => placeList.add(place)));
    getPlaces(lat, lng, widget.searchKey, placesStreamController);
  }

  @override
  initState() {
    super.initState();
    placeList = [];
    _getPlaces(28.546, 77.328);
  }

  @override
  dispose() {
    super.dispose();
    placesStreamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView(
        children: placeList.map((place) => new PlaceWidget(place)).toList(),
      ),
    );
  }
}
