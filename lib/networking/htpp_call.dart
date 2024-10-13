import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiCalls {
  static String url = 'https://jsonplaceholder.typicode.com/posts';

  static Future getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      debugPrint(
          'response data ==============================================================================');
      debugPrint(response.body);
      List data = jsonDecode(response.body);

      return data;
    } else {
      debugPrint('Status error with ${response.statusCode}');
    }
  }
}
