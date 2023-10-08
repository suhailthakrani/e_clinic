class TokenModel {
  String accessToken = "";
  int clientId = 0;
  String expiryTime = "";

  TokenModel.fromString(String token) {
    accessToken = token;
    expiryTime = DateTime.now().add(const Duration(days: 6)).toString();
  }

  TokenModel.fromSession(Map<String, dynamic> json) {
    accessToken = json["token"] ?? '';
    clientId = json["client_id"] ?? 0;
    expiryTime = json["expiryTime"] ?? '';
  }

  Map<String, dynamic> forSession() {
    return {
      "client_id": clientId,
      "token": accessToken,
      "expiryTime": expiryTime,
    };
  }

  bool get isExpired {
    if (expiryTime.isEmpty) return true;
    try {
      return DateTime.parse(expiryTime).isBefore(DateTime.now());
    } catch (_) {
      return true;
    }
  }

  @override
  String toString() {
    return 'TokenModel{token: $accessToken, clientId: $clientId, expiryTime: $expiryTime}';
  }
}
