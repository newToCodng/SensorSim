import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String _baseUrl = "http://127.0.0.1:8000/readings";

  static String get baseUrl => _baseUrl;

  final http.Client client;

  ApiService({http.Client? client}) : client = client ?? http.Client();

  // Fetch all readings
  Future<List<dynamic>> getReadings() async {
    final response = await client.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['readings'] ?? [];
    } else {
      throw Exception("Failed to load readings");
    }
  }
}