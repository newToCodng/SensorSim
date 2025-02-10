import 'package:flutter/material.dart';
import 'api_service.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<dynamic> _readings = [];
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startPolling();
  }

  // Fetch data and update state
  Future<void> _fetchData() async {
    try {
      final apiService = ApiService();
      final data = await apiService.getReadings();
      setState(() {
        _readings = data; //Update state with new data
      });
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  // Poll backend every 5 seconds
  void _startPolling() {
    _timer = Timer.periodic(Duration(seconds:5), (timer) {
      _fetchData(); // Fetch new data every 5 seconds
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Stop polling when widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Glucose Monitor"),
        ),
        body: _readings.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
            itemCount: _readings.length,
            itemBuilder: (context, index) {
              final value = _readings[index]['value'];
              return ListTile(
                title: Text("${value.toStringAsFixed(1)} mg/dL"),
                trailing: value > 180 || value < 70
                ? Icon(Icons.warning, color: Colors.red)
                : null,
              );
            },
        )
      ),
    );
  }

}
