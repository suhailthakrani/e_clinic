/*Created By: Suhail Thakrani on 23-Sept-2023*/

import 'dart:math';

import 'package:e_clinic/models/lab_model.dart';
import 'package:e_clinic/models/me_model.dart';

import '../models/user_login_model.dart';
import '../services/service_urls.dart';

import '../models/response_model.dart';
import '../models/token_model.dart';
import '../models/user_model.dart';
import '../utils/common_code.dart';
import '../utils/user_session.dart';
import 'http_client.dart';

class UserService {
  static final UserService _instance = UserService._internal();
  UserService._internal() {
    _httpClient = HTTPClient();
  }
  factory UserService() => _instance;

  late HTTPClient _httpClient;

  Future<UserModel> registerUser({required UserModel userModel}) async {
    // Map<String, String> files = {
    //   'degree_document': userModel.degreeDocument,
    // };

    ResponseModel responseModel = await _httpClient.postRequest(
      url: kRegisterURL,
      requestBody:userModel.toJson(),
      requireToken: false
    );
    if (responseModel.message == "Success") {
      userModel.responseMessage = 'Success';
    } else {
      userModel.responseMessage = responseModel.message;
    }
    return userModel;
  }

  Future<UserModel> loginUser(
      {required String username, required String password}) async {
    UserModel user = UserModel.empty();
    ResponseModel responseModel = await _httpClient.postRequest(
        url: kLoginURL,
        requestBody: {'email': username, 'password': password},
        requireToken: false);
    if ((responseModel.message == "Login successful" || responseModel.message == "Success")&&
        responseModel.data != null &&
        responseModel.data['token'] != null) {
          print("================================================${responseModel.toString()}");
      user = UserModel.fromJson(responseModel.data['user'] ?? {});
      UserSession().saveToken(token: TokenModel.fromString(responseModel.data['token'] ?? ''));
      print("=========================${responseModel.data['token'] ?? ''}");
    } else {
      user.responseMessage = responseModel.message;
    }
    return user;
  }

  

   Future<MeModel> getMyData() async {
    ResponseModel responseModel = await _httpClient.getRequest(url: kGetMeURL);
    if (responseModel.message == "Success" && responseModel.data != null && responseModel.data is Map) {
      return MeModel.fromJson(responseModel.data);
    } else{
      CommonCode().showToast(message: responseModel.message);
    }
    return MeModel.fromJson({});
    
  }

  Future<LabModel> registerLab({required LabModel labModel}) async {
    // Map<String, String> files = {
    //   'degree_document': userModel.degreeDocument,
    // };

    ResponseModel responseModel = await _httpClient.postRequest(
      url: "${kBaseURL}lab",
      requestBody:labModel.toJson(),
      requireToken: false
    );
    if (responseModel.message == "Success") {
      labModel.responseMessage = 'Success';
    } else {
      labModel.responseMessage = responseModel.message;
    }
    return labModel;
  }

  Future<UserModel> loginAsLab(
      {required String username, required String password}) async {
    UserModel user = UserModel.empty();
    ResponseModel responseModel = await _httpClient.postRequest(
        url: "${kBaseURL}lab/signin",
        requestBody: {'email': username, 'password': password},
        requireToken: false);
    if ((responseModel.message == "Login successful" || responseModel.message == "Success")&&
        responseModel.data != null &&
        responseModel.data['token'] != null) {
          print("================================================${responseModel.toString()}");
      user = UserModel.fromJson(responseModel.data['user'] ?? {});
      UserSession().saveToken(token: TokenModel.fromString(responseModel.data['token'] ?? ''));
      print("=========================${responseModel.data['token'] ?? ''}");
    } else {
      user.responseMessage = responseModel.message;
    }
    return user;
  }

  
}
