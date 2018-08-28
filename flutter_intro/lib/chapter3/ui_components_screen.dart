import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_intro/chapter2/model/places.dart' as places;
import 'package:flutter_intro/chapter2/presenter/places_presenter.dart';
import 'package:flutter_intro/chapter2/view/places_list_single_item.dart';
import 'package:flutter_intro/chapter3/utils/colors.dart';
import 'package:flutter_intro/chapter3/utils/ui_utils.dart';

class UiComponentScreen extends StatefulWidget {
  UiComponentScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _UiComponentScreenState createState() => new _UiComponentScreenState();
}

class _UiComponentScreenState extends State<UiComponentScreen> {
//  StreamController<places.Place> placesStreamController;

  bool checkboxValue = false;

  @override
  initState() {
    super.initState();
  }

//  @override
//  dispose() {
//    super.dispose();
//    placesStreamController.close();
//  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          textH1("H1", 1),
          textH2("H2", 1),
          textH3("H3", 1),
          textH4("H4", 1),
          textH5("H5", 1),
          textH6("H6", 1),
          new RichText(
            text: new TextSpan(
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                  color: grey0,
                  fontFamily: POPPINS_FONT,
                  fontSize: 16.0),
              children: <TextSpan>[
                new TextSpan(
                  text: 'TEST test. ',
                  style: new TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
                new TextSpan(
                  text: 'TEST test. ',
                  style: new TextStyle(color: Colors.black.withOpacity(0.8)),
                ),
                new TextSpan(
                  text: 'TEST test.',
                  style: new TextStyle(color: Colors.black.withOpacity(1.0)),
                ),
              ],
            ),
          ),
          textField(),
          raisedButton(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Radio(
                value: 0,
                groupValue: _radioValue,
                onChanged: (value) => _handleRadioValueChange(value),
                activeColor: Colors.amber,
              ),
              new Radio(
                value: 1,
                groupValue: _radioValue,
                onChanged: (value) => _handleRadioValueChange(value),
                activeColor: Colors.amber,
              ),
              new Radio(
                value: 2,
                groupValue: _radioValue,
                onChanged: (value) => _handleRadioValueChange(value),
                activeColor: Colors.amber,
              ),
            ],
          ),
          MyImage(
              imageProvider: NetworkImage(
                  'https://images.pexels.com/photos/67636/rose-blue-flower-rose-blooms-67636.jpeg?auto=compress&cs=tinysrgb&h=350')),
        ],
      )),
    );
  }

  // state variable
  String _result = "none";
  int _radioValue = 0;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          _result = 'first';
          break;
        case 1:
          _result = 'second';
          break;
        case 2:
          _result = 'third';
          break;
      }
    });
  }

  Widget textField() {
    return TextField(
        autocorrect: true,
        maxLines: 1,
//      onChanged: onChanged,
//      onSubmitted: onSubmitted,
        decoration: new InputDecoration(
            counterText: "test",
            filled: true,
            fillColor: grey3,
            hintText: 'Enter text here...'));
  }

  Widget raisedButton() {
    return new RaisedButton(
      child: const Text(
        'Test goes here!',
        style: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
            color: Colors.white,
            fontFamily: NUNITOSANS_FONT,
            fontSize: 16.0),
      ),
      color: Theme.of(context).accentColor,
      elevation: 4.0,
      splashColor: Colors.white30,
      onPressed: () {
        // Perform some action
      },
    );
  }
}

class MyImage extends StatefulWidget {
  const MyImage({
    Key key,
    @required this.imageProvider,
  })  : assert(imageProvider != null),
        super(key: key);

  final ImageProvider imageProvider;

  @override
  _MyImageState createState() => new _MyImageState();
}

class _MyImageState extends State<MyImage> {
  ImageStream _imageStream;
  ImageInfo _imageInfo;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // We call _getImage here because createLocalImageConfiguration() needs to
    // be called again if the dependencies changed, in case the changes relate
    // to the DefaultAssetBundle, MediaQuery, etc, which that method uses.
    _getImage();
  }

  @override
  void didUpdateWidget(MyImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.imageProvider != oldWidget.imageProvider) _getImage();
  }

  void _getImage() {
    final ImageStream oldImageStream = _imageStream;
    _imageStream =
        widget.imageProvider.resolve(createLocalImageConfiguration(context));
    if (_imageStream.key != oldImageStream?.key) {
      // If the keys are the same, then we got the same image back, and so we don't
      // need to update the listeners. If the key changed, though, we must make sure
      // to switch our listeners to the new image stream.
      oldImageStream?.removeListener(_updateImage);
      _imageStream.addListener(_updateImage);
    }
  }

  void _updateImage(ImageInfo imageInfo, bool synchronousCall) {
    setState(() {
      // Trigger a build whenever the image changes.
      _imageInfo = imageInfo;
    });
  }

  @override
  void dispose() {
    _imageStream.removeListener(_updateImage);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new RawImage(
      image: _imageInfo?.image, // this is a dart:ui Image object
      scale: _imageInfo?.scale ?? 1.0,
    );
  }
}
