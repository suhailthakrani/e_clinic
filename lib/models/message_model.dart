class MessageGet {
  String id = '';
  Participant participant = Participant.empty();
  String unreadCount = '';

  MessageGet({
    required this.id,
    required this.participant,
    required this.unreadCount,
  });

  factory MessageGet.fromJson(Map<String, dynamic> json) {
    return MessageGet(
      id: json['id']??'',
      participant: Participant.fromJson(json['Participant']??{'id': '','Participant': {},'unreadCount': '0',}),
      unreadCount: "${json['unreadCount']??''}",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Participant': participant.toJson(),
      'unreadCount': unreadCount,
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
      message: json['Message']??'',
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
      id: json['id']??'',
      firstName: json['first_name']??'',
      lastName: json['last_name']??'',
      image: json['image']??'',
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
