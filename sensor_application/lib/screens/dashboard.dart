import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:sensor_application/providers/telemetry_provider.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(alertStreamProvider);
    final activeAlerts = ref.watch(activeAlertsProvider);

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
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: const LatLng(9.9312, 8.8853),
              initialZoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                userAgentPackageName: 'com.aetechlabs.sensorclient',
              ),
              MarkerLayer(
                markers: activeAlerts.map((alert) {
                  return Marker(
                    point: LatLng(alert.latitude, alert.longitude),
                    child: const Icon(Icons.warning),
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
