import '../models/user_model.dart';

class UserLoginModel {
  String username = "";
  String _password = "";

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    username = json["username"] ?? "";
    _password = json["password"] ?? "";
  }

  String get password => _password;

  UserLoginModel.empty()
      : username = '',
        _password = '';

  @override
  String toString() {
    return 'UserLoginModel{username: $username, _password: $_password,}';
  }
}
