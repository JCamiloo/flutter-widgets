import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider {
  
  List<dynamic> options = [];

  Future<List<dynamic>> loadData() async {
    final data = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(data);
    options = dataMap['routes'];
    return options;
  }
}

final menuProvider = new _MenuProvider();