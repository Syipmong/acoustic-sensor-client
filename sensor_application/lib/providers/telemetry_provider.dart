import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensor_application/models/alert.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

final webSocketProvider = Provider<WebSocketChannel>((ref) {
  final channel = WebSocketChannel.connect(
    Uri.parse('ws://localhost:8080/ws/alerts'),
  );

  ref.onDispose(channel.sink.close);
  return channel;
});

final alertProvider = StreamProvider<Alert>((ref) {
  final channel = ref.watch(webSocketProvider);

  return channel.stream.map((message) {
    final json = jsonDecode(message as String) as Map<String, dynamic>;
    return Alert.fromJson(json);
  });
});
