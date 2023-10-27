import 'package:e_clinic/services/service_urls.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:http/http.dart' as http;
import 'dart:convert';

class SocketService {

  late io.Socket _socket;

  SocketService._internal() {
    _socket = io.io('https://api.eclinic.live/api');
  }

  factory SocketService() {
    return _instance;
  }
  static final SocketService _instance = SocketService._internal();

  void connect() {
    _socket.connect();
  }

  void disconnect() {
    _socket.disconnect();
  }

  void createMessage(String message) {
    _socket.emit('data', message);
  }

  Future<List<String>> getAllMessages() async {
    final response = await http.get(Uri.parse('${kBaseURL}messages/conversations/list'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.cast<String>();
    } else {
      throw Exception('Failed to load messages');
    }
  }

  Future<String> getSingleMessageById(String id) async {
    final response = await http.get(Uri.parse('https://api.eclinic.live/api/messages/$id'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load message');
    }
  }
}
