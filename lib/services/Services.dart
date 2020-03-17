import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:modana_mobile_muhammad_flutter/models/publics.dart';

class Services {
  static const String url = 'https://api.publicapis.org/entries';

  static Future<Publics> getPublics() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        return parseJson(response.body);
      } else {
        return Publics();
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return Publics();
    }
  }

  static Publics parseJson(String responseBody) {
    final parsed = json.decode(responseBody);
    Publics p = new Publics.fromJson(parsed);
    return p;
  }
}
