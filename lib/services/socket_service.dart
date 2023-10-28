import 'dart:developer';

import 'package:e_clinic/models/message_model.dart';
import 'package:e_clinic/services/http_client.dart';
import 'package:e_clinic/services/service_urls.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'dart:convert';

class SocketService {
  late io.Socket _socket;

  SocketService._internal() {
    _socket = io.io(kBaseURL);
    _socket.on('message', (data) {
      // Handle received message here
      var receivedMessage = MessageGet.fromJson(jsonDecode(data));
      // Do something with receivedMessage, e.g., update UI or trigger a notification
    });
  }

  io.Socket get socket => _socket;

  factory SocketService() {
    return _instance;
  }
  static final SocketService _instance = SocketService._internal();

 void connect() {
  _socket.onConnect((_) {
    log('Socket connected');
  });
  _socket.onDisconnect((_) {
    log('Socket disconnected');
  });
  _socket.connect();
}

  void disconnect() {
    _socket.disconnect();
  }

  void sendSocketMessage({required MessageSend message, Function? onSent}) {
  try {
    _socket.emit('message', jsonEncode(message));

    if (onSent != null) {
      _socket.once('message', (data) {
        // This will be called when the server acknowledges the message
        onSent();
      });
    } else{
      log("------------message");
    }
  } on Exception catch (e) {
    log("----------------------${e}");
  }
}

}
