/*Created By: Suhail Thakrani on 23-Sept-2023*/

import 'dart:convert';
import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import '../models/availability_model.dart';
import '../services/service_urls.dart';
import '../models/response_model.dart';
import 'http_client.dart';

class AvailabilityService {
  static final AvailabilityService _instance = AvailabilityService._internal();
  AvailabilityService._internal() {
    _httpClient = HTTPClient();
  }
  factory AvailabilityService() => _instance;

  late HTTPClient _httpClient;

  Future<String> addShedule(
      {required String drID,
      required List<AvailabilityModel> availabilityList}) async {
    List<Map<String, dynamic>> availability =
        availabilityList.map((e) => e.toJson()).toList();

    ResponseModel responseModel = await _httpClient.putRequest(
      url: kAddScheduleURL,
      requestBody: jsonEncode(availability),
      requireToken: true,
    );

    return responseModel.message;
  }

//TODO: Model Pass
  Future updateSchedule({required String appointmentId}) async {
    ResponseModel responseModel = await _httpClient.postRequest(
      url: kUpdateChargesURL,
      requestBody: /*TODO: */ {},
      requireToken: true,
    );
    if (responseModel.message == "Success" && responseModel.data != null) {
      //
    } else {
      // user.responseMessage = responseModel.message;
    }
    // return user;
  }
}
