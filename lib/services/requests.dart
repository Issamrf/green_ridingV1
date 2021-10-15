import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Requests {
  static Future<dynamic> getRequest(String url) async {
    http.Response response = await http.get(Uri.parse(url));

    try {
      if (response.statusCode == 200) {
        String jsonData = response.body;
        var decodeData = jsonDecode(jsonData);
        return decodeData;
      } else {
        return "No response";
      }
    } catch (exp) {
      return "No response";
    }
  }
}
