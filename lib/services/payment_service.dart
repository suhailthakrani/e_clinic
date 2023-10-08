/*Created By: Suhail Thakrani on 23-Sept-2023*/

import '../models/user_login_model.dart';
import '../services/service_urls.dart';

import '../models/response_model.dart';
import '../models/token_model.dart';
import '../models/user_model.dart';
import '../utils/common_code.dart';
import '../utils/user_session.dart';
import 'http_client.dart';

class PaymentService {
  static final PaymentService _instance = PaymentService._internal();
  PaymentService._internal() {
    _httpClient = HTTPClient();
  }
  factory PaymentService() => _instance;

  late HTTPClient _httpClient;

  Future addCharges({required String appointmentId}) async {
    
    ResponseModel responseModel = await _httpClient.postRequest(
        url: kAddChargesURL,
        requestBody: /*TODO: */{},
        requireToken: false,);
    if (responseModel.message == "Success" && responseModel.data != null) {
     //
    } else {
      // user.responseMessage = responseModel.message;
    }
    // return user;
  }

//TODO: Model Pass
  Future updateharges({required String appointmentId}) async {
    
    ResponseModel responseModel = await _httpClient.postRequest(
        url: kUpdateChargesURL,
        requestBody: /*TODO: */{},
        requireToken: false,);
    if (responseModel.message == "Success" && responseModel.data != null) {
     //
    } else {
      // user.responseMessage = responseModel.message;
    }
    // return user;
  }

}
