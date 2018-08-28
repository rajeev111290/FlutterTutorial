import 'package:flutter/material.dart';
import 'package:flutter_intro/Chapter4/basic_functions_screen.dart';
import 'package:flutter_intro/chapter2/view/result_screen.dart';
import 'package:flutter_intro/chapter3/ui_components_screen.dart';
//import 'package:flutter_html_view/flutter_html_view.dart';

void main() => runApp(new MyApp());

String html =
    '<h1>This is heading 1</h1> <h2>This is heading 2</h2><h3>This is heading 3</h3><h4>This is heading 4</h4><h5>This is heading 5</h5><h6>This is heading 6</h6><p><img alt="Test Image" src="https://i.ytimg.com/vi/RHLknisJ-Sg/maxresdefault.jpg" /></p>';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: new MyHomePage(title: 'Flutter Tutorial'),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: 'Flutter Tutorial'),
        '/result': (context) => ResultScreen(title: 'Restaurants Near By'),
        '/ui_comp_1': (context) => UiComponentScreen(title: 'UI Components'),
        '/basic_functions': (context) =>
            BasicFunctionsScreen(title: 'Basic Functions'),
      },
    );
  }
}

// Home Screen Widget
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

// Home Screen Widget State
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                child: new Text(
                  'Welcome to Flutter Tutorial',
                )),
            RaisedButton(
                child: Text('Find restaurants near me!'),
                onPressed: () {
                  // Navigate to second screen when tapped!
                  Navigator.pushNamed(context, '/result');
                }),

            RaisedButton(
                child: Text('UI Components Screen!'),
                onPressed: () {
                  // Navigate to second screen when tapped!
                  Navigator.pushNamed(context, '/ui_comp_1');
                }),
            RaisedButton(
                child: Text('Basic Funtions Screen!'),
                onPressed: () {
                  // Navigate to second screen when tapped!
                  Navigator.pushNamed(context, '/basic_functions');
                }),
//            new HtmlView(data: html),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Does nothing',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
