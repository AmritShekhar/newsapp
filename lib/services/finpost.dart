import 'dart:convert';

import 'package:http/http.dart' as http;

class FinPost {
  String baseUrl =
      "https://rainbownews.co.in/wp-json/wp/v2/posts?_embed&category/finance";

  Future<List> getFinPost() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));

      // print(response);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error");
      }
    } catch (socketException) {
      return Future.error("Fetching Error");
    }
  }
}
