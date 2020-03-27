
import 'package:flutter/material.dart';
import 'package:components/src/providers/menu_provider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Components')),
      body: _list(),
    );
  }

  Widget _list() {    
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
        return ListView(children: _itemList(snapshot.data));
      },
    );
  }

  List<Widget>_itemList(List<dynamic> data) {
    final List<Widget> options = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['text']),
        leading: Icon(Icons.adjust, color: Colors.blue,),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue),
        onTap: () {},
      );
      
      options..add(widgetTemp)..add(Divider(height: 0.0,));
    });
    
    return options;
  }
}