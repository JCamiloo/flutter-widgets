import 'package:flutter/material.dart';
import 'dart:async';

class ListViewPage extends StatefulWidget {

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  ScrollController _scrollCtrl = new ScrollController();
  List<int> _numbersList = [0];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _addImages();
    _scrollCtrl.addListener(() {
      if (_scrollCtrl.position.pixels == _scrollCtrl.position.maxScrollExtent) {
        _fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('Listview Page')),
        body: Stack(
          children: <Widget>[
            _createList(),
            _createLoading()
        ]),
      ),
    );
  }

  Widget _createList() {
    return ListView.builder(
      padding: EdgeInsets.all(0.0),
      controller: _scrollCtrl,
      itemCount: _numbersList.length,
      itemBuilder: (BuildContext context, int index) {
        final image = _numbersList[index];
        return FadeInImage(
          image: NetworkImage('https://picsum.photos/500/300/?image=$image'),
          placeholder: AssetImage('assets/loading.gif'),
          height: 300,
          fit: BoxFit.cover,
        );
      },
    );
  }

  void _addImages() {
    int lastItem = _numbersList[_numbersList.length - 1];
    for (int i = 0; i < 10; i++) {
      lastItem++;
      _numbersList.add(lastItem);
    }
    setState(() {});
  }

  Future _fetchData() async {
    _isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    return new Timer(duration, _fakeHttpResponse);
  }

  void _fakeHttpResponse() {
    _isLoading = false;
    _scrollCtrl.animateTo(
      _scrollCtrl.position.pixels + 100, 
      duration: Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn);
    _addImages();
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(height: 50.0)
            ],
          )
        ],
      );
    } else {
      return Container();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollCtrl.dispose();
  }
}