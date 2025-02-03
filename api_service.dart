import 'package:http/http.dart' as http;
import 'dart:convert';




class ApiService {
  static const String _baseUrl = "http://127.0.0.1:8000";

  // Fetch all readings
  static Future<List<dynamic>> getReadings() async {
    final response = await http.get(Uri.parse('$_baseUrl/readings'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load readings");
    }
  }

  static Future<Map<String, dynamic>> sendReading(double value) async {
    final response = await http.post(Uri.parse('$_baseUrl/readings'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'value': value}),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to send reading');
    }
  }
}