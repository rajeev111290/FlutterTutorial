
import 'dart:async';
import 'dart:convert';
import 'package:flutter_intro/chapter2/constants.dart';
import 'package:flutter_intro/chapter2/model/places.dart' as places;
import 'package:http/http.dart' as http;



getPlaces(double lat, double lng,String searchKey,
    StreamController<places.Place> placeStreamController) async {
  var url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json' +
      '?location=$lat,$lng' +
      '&radius=500&type=$searchKey' +
      '&key=$gcpKey';
  // http.get(url).then( (resp) => print(resp.body));
  var client = new http.Client();
  //  client.head(url)
  var req = new http.Request('get', Uri.parse(url));
  //  req.headers
  //  HttpClientRequest request = new HttpClientRequest('')
  //  request.headers.contentType
  //  = new ContentType("application", "json", charset: "utf-8");

  var streamedRes = await client.send(req);

  streamedRes.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .expand((jsonBody) => (jsonBody as Map)['results'])
      .map((jsonPlace) {
        print(jsonPlace);
        return new places.Place.fromJson(jsonPlace);
      })
      .pipe(placeStreamController);
  /*
    .listen( (data) => print(data))
    .onDone( () => client.close())
    */
}
