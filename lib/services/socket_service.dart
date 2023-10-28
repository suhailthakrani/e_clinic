import 'package:e_clinic/models/message_model.dart';
import 'package:e_clinic/models/response_model.dart';
import 'package:e_clinic/services/http_client.dart';
import 'package:e_clinic/services/service_urls.dart';
import 'package:e_clinic/utils/common_code.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:http/http.dart' as http;
import 'dart:convert';

class SocketService {
  late io.Socket _socket;

  SocketService._internal() {
    _socket = io.io('https://api.eclinic.live/api');
    _httpClient = HTTPClient();
  }

  factory SocketService() {
    return _instance;
  }
  static final SocketService _instance = SocketService._internal();
  late HTTPClient _httpClient;

  void connect() {
    _socket.connect();
  }

  void disconnect() {
    _socket.disconnect();
  }

  void sendSocketMessage(MessageSend message, String id) {
    // Connect to the socket server
    io.Socket socket = io.io('https://api.eclinic.live/api/messages/$id');
    socket.connect();
    // Define the message in the format you provided
    // Map<String, dynamic> message = {
    //   "id": "6f78d80e-96d9-4b4d-8fba-a9d60cea92ac",
    //   "Participant": {
    //     "id": "6565bf6a-cf49-4f09-9f26-9a953f6c3090",
    //     "first_name": "Jane",
    //     "last_name": "Doe",
    //     "image": null
    //   },
    //   "Message": null
    // };

    // Send the message through the socket
    socket.emit('data', jsonEncode(message));
    socket.disconnect();
  }

  Future<List<MessageGet>> getAllMessages() async {
    ResponseModel responseModel = await _httpClient.getRequest(
        url: '${kBaseURL}messages/conversations/list');
    List<MessageGet> messages = [];
    if (responseModel.message == "Success" &&
        responseModel.data != null &&
        responseModel.data.length > 0) {
      for (var data in (responseModel.data['doctors'] ?? [])) {
        messages.add(MessageGet.fromJson(data));
      }
    } else {
      CommonCode().showToast(message: responseModel.message);
    }
    return messages;
  }

  Future<String> getSingleMessageById(String id) async {
    final response =
        await http.get(Uri.parse('https://api.eclinic.live/api/messages/$id'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      CommonCode().showToast(message: 'Failed to load messages');
      return 'Failed to load messages';
    }
  }
}
