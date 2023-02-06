import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cozy_new/models/Space.dart';

class SpaceProvider extends ChangeNotifier {
  Future<List<Space>> getRecommendedSpaces() async {
    var url = Uri.parse('https://bwa-cozy-api.vercel.app/recommended-spaces');
    var result = await http.get(url);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Space> spaces = data.map((item) {
        return Space.fromJson(item);
      }).toList();

      return spaces;
    } else {
      return <Space>[];
    }
  }
}
