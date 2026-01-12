import 'package:http/http.dart' as http;
import 'dart:convert';


class Aip {
  Future<List<dynamic>> fetchData(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

Future<dynamic> post({required String url, required dynamic body, String? token}) async {
  final headers = <String, String>{};
  if (token != null && token.isNotEmpty) {
    headers['Authorization'] = 'Bearer $token';
  }

  http.Response response = await http.post(
    Uri.parse(url),
    body: body,
    headers: headers.isEmpty ? null : headers,
  );
  if (response.statusCode == 200 || response.statusCode == 201) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to post data ${response.statusCode} and body: ${jsonDecode(response.body)}');
  }
}


Future<dynamic> put({required String url, required dynamic body, String? token}) async {
  final headers = <String, String>{};
  if (token != null && token.isNotEmpty) {
    headers['Authorization'] = 'Bearer $token';
  }

  headers.addAll({'Content-Type': 'application/json'});

  http.Response response = await http.put(
    Uri.parse(url),
    body: body,
    headers: headers.isEmpty ? null : headers,
  );
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to put data ${response.statusCode} and body: ${jsonDecode(response.body)}');
  }

}
}