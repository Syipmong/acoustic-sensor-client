import 'package:flutter/material.dart';

void main() {
  runApp(const SensorClient());
}

class SensorClient extends StatelessWidget {
  const SensorClient({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello world'))),
    );
  }
}
