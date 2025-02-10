import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:sensor_sim/api_service.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  setUpAll(() {
    registerFallbackValue(Uri()); // 🔥 Fixes type safety issue
  });

  group('ApiService Tests', () {
    final mockClient = MockClient();
    final apiService = ApiService(client: mockClient);

    test('getReadings returns data on success', () async {
      final url = Uri.parse(ApiService.baseUrl);

      when(() => mockClient.get(url))
          .thenAnswer((_) async => http.Response(
          '{"readings": [{"value": 100.0}]}', 200));

      final result = await apiService.getReadings();

      expect(result, isA<List<dynamic>>());
      expect(result.first['value'], 100.0);
    });
  });
}
