import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensor_application/providers/telemetry_provider.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(alertStreamProvider);
    ref.watch(activeAlertsProvider);

    ref.listen(alertStreamProvider, (previous, next) {
      next.whenData((alert) {
        ref.read(activeAlertsProvider.notifier).addAlert(alert);
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Telemetry Dashboard'),
        backgroundColor: Colors.black87,
      ),
    );
  }
}
