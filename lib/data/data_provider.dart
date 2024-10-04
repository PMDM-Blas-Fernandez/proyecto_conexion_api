import 'package:http/http.dart' as http;

class DataProvider {
  static Future<http.Response> getRequest({
    required String endpoint,
  }) async {
    try {
      return await http.get(Uri.parse(endpoint));
    } catch (e) {
      rethrow;
    }
  }
}
