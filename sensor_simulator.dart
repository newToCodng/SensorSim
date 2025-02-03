import 'dart:async';
import 'dart:math';

import 'package:sensor_sim/api_service.dart';

double generateGlucoseReading () {
  Random random = Random();
  double normalValue = 70 + random.nextDouble() * (180 - 70);

  if (random.nextDouble() < 0.05) {
    return random.nextDouble() < 0.5 
        ? random.nextDouble() * (60 - 40) + 40 // Lower random outlier (50-60 mg/dL)
        : random.nextDouble() * (300 - 200) + 200; // Higher random outlier (200-300 mg/dL) 
  }
  return normalValue;
}

Future<void> sendSensorData() async {
  while (true) {
    final glucoseLevel = generateGlucoseReading();
    try {
      await ApiService.sendReading(glucoseLevel);
      print("✅ Sent: $glucoseLevel mg/dL");
    } catch (e) {
      print("❌ Error: $e");
    }
    await Future.delayed(Duration(seconds: 5));
  }
}


void main() {
  sendSensorData(); // Start
}