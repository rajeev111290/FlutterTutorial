import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_intro/Chapter4/item_list_single_item.dart';
import 'package:flutter_intro/Chapter4/models/item_model.dart';
import 'package:flutter_intro/Chapter4/resources/repository.dart';

class BasicFunctionsScreen extends StatefulWidget {
  BasicFunctionsScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BasicFunctionsScreenState createState() => new _BasicFunctionsScreenState();
}

class _BasicFunctionsScreenState extends State<BasicFunctionsScreen> {
//  StreamController<ItemModel> itemStreamController;
  List<ItemModel> itemList;
  Repository repository;
  bool checkboxValue = false;

  @override
  initState() {
    super.initState();
    itemList = [];
    repository=new Repository();
    getData();
  }

  getData() async {
    List<int> idList = await repository.fetchTopIds();
    List<ItemModel> data=[];

    for (int id in idList) {
      data.add(await repository.fetchItem(id));
    }
    setState(() {
      itemList=data;
    });
  }

  @override
  dispose() {
    super.dispose();
    itemList=[];
//    itemStreamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView(
        children: itemList.map((news) => new NewsWidget(news)).toList(),
      ),
    );
  }
}
