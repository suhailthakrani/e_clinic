class Message {
  String senderId = '';
  String recieverId = '';
  Participant participant = Participant.empty();
  String unreadCount = '';
  String message = ''; // Added this line

  Message({
    required this.senderId,
    required this.recieverId,
    required this.participant,
    required this.unreadCount,
    required this.message, // Added this line
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      senderId: json['senderId'] ?? '',
      recieverId: json['recieverId'] ?? '',
      participant: Participant.fromJson(json['Participant'] ??
          {
            'id': '',
            'Participant': {},
            'unreadCount': '0',
          }),
      unreadCount: "${json['unreadCount'] ?? ''}",
      message: json['messageText'] ?? '', // Added this line
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'recieverId': recieverId,
      'Participant': participant.toJson(),
      'unreadCount': unreadCount,
      'message': message, // Added this line
    };
  }
}

class MessageGet {
  String id = '';
  Participant participant = Participant.empty();
  String unreadCount = '';
  String message = ''; // Added this line

  MessageGet({
    required this.id,
    required this.participant,
    required this.unreadCount,
    required this.message, // Added this line
  });

  factory MessageGet.fromJson(Map<String, dynamic> json) {
    return MessageGet(
      id: json['id'] ?? '',
      participant: Participant.fromJson(json['Participant'] ??
          {
            'id': '',
            'Participant': {},
            'unreadCount': '0',
          }),
      unreadCount: "${json['unreadCount'] ?? ''}",
      message: json['Message'] ?? '', // Added this line
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Participant': participant.toJson(),
      'unreadCount': unreadCount,
      'message': message, // Added this line
    };
  }
}

class MessageSend {
  String id = '';
  Participant participant = Participant.empty();
  String message = '';

  MessageSend({
    required this.id,
    required this.participant,
    required this.message,
  });
  MessageSend.empty();

  factory MessageSend.fromJson(Map<String, dynamic> json) {
    return MessageSend(
      id: json['id'] ?? '',
      participant: Participant.fromJson(json['Participant'] ?? {}),
      message: json['Message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Participant': participant.toJson(),
      'Message': message,
    };
  }
}

class Participant {
  String id = '';
  String firstName = '';
  String lastName = '';
  String? image = '';

  Participant.empty();

  Participant({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.image,
  });

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      id: json['id'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'image': image,
    };
  }
}
