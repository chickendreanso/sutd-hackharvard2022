import 'package:http/http.dart';
import 'dart:convert';

Future<Map<String, dynamic>> _httpGet(String urlString) async {
  var response = await get(Uri.parse(urlString));
  if (response.statusCode != 200) {
    throw Exception("API error");
  }

  return jsonDecode(response.body);
}
