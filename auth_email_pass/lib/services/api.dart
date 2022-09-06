import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'package:firebase_auth/firebase_auth.dart';

class ApiService {
  static Future<Map<String, dynamic>> getToken(User user) async {
    var url = Uri.http('localhost:8000', '/uid/' + user.uid);
    var res = await http.get(url);

    print("res.statusCode: ${res.statusCode}");
    if (res.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(res.body) as Map<String, dynamic>;

      print(jsonResponse);

      return jsonResponse;
    }
    throw Error();
  }
}
