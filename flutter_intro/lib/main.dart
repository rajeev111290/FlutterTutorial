import 'package:flutter/material.dart';
import 'package:flutter_intro/Chapter4/basic_functions_screen.dart';
import 'package:flutter_intro/chapter2/view/result_screen.dart';
import 'package:flutter_intro/chapter3/ui_components_screen.dart';
import 'package:html2md/html2md.dart' as html2md;
import 'package:flutter_markdown/flutter_markdown.dart';

void main() => runApp(new MyApp());

String html ="<p>BOB Manipal PO 2018 Result Out! Bank of Baroda has declared the result for BOB Manipal PO (PGDBF) recruitment 2018 on 27th August 2018. Candidates who have appeared in the online test conducted on 28th July 2018 can check their&nbsp;online exam result through the PDF shared below -</p>\r\n<div id=\"postText\" class=\"col-md-12\">\r\n<h2 style=\"text-align: center;\"><span style=\"color: #4713bf;\"><a style=\"color: #4713bf;\" href=\"https://gradeup-question-images.grdp.co/liveData/f/2018/8/BOB_Result2018-19.pdf-37.pdf\" target=\"_blank\" rel=\"noopener\"><strong>BOB PO PGDBF&nbsp;Online Exam Result 2018-19, Click here!</strong></a></span></h2>\r\n<p><span style=\"color: #333333;\">Alternatively, you can also check your result through official website of Bank of Baroda.</span></p>\r\n<h2><strong>BOB Manipal&nbsp;PO Result 2018&nbsp;- Important Dates</strong></h2>\r\n<ul>\r\n<li><strong>Online Examination Date:</strong> 28th July 2018</li>\r\n<li><strong>Online exam result declaration date:</strong> 27th August 2018</li>\r\n</ul>\r\n<p>The selected candidates now will have to undergo Group discussion and Interview round. The dates and venue for the same will be communicated to the candidates shortly.</p>\r\n<h2 style=\"text-align: center;\"><span style=\"color: #ed5b6c;\"><strong>Heartiest Congratulations to all the selected candidates.</strong></span></h2>\r\n<p>&nbsp;<strong>All the best for group discussion &amp; Interview,</strong></p>\r\n<p><strong>Team gradeup</strong></p>\r\n</div>";
var markdownData;
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme:
          ThemeData(brightness: Brightness.light, primarySwatch: Colors.green),
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
    markdownData = html2md.convert(html);
    debugPrint(markdownData);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Scrollbar(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new MarkdownBody(
                data: markdownData,
              ),
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
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Does nothing',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
