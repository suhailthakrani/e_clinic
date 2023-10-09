/*Created By: Suhail Thakrani on 23-Sept-2023*/

import 'package:e_clinic/services/service_urls.dart';

import '../models/appointment_model.dart';
import '../models/appointment_type.dart';

import '../models/response_model.dart';
import '../utils/common_code.dart';
import 'http_client.dart';

class AppointmentService {
  static final AppointmentService _instance = AppointmentService._internal();
  AppointmentService._internal() {
    _httpClient = HTTPClient();
  }
  factory AppointmentService() => _instance;

  late HTTPClient _httpClient;

  Future getAppointmentsList() async {
    ResponseModel responseModel =
        await _httpClient.getRequest(url: kGetAppointmentsURL);

    if (responseModel.message == "Success" &&
        responseModel.data != null &&
        responseModel.data.length > 0) {
      //
    } else {
      CommonCode().showToast(message: responseModel.message);
    }
    //
  }

  Future<List<Appointment>> getRequestedAppointmentsList() async {
    List<Appointment> appointLst = [];

    ResponseModel responseModel =  await _httpClient.getRequest(url: kGetAppointmentRequestsURL);

    if (responseModel.message == "Success" && responseModel.data != null && responseModel.data.length > 0) {
      for (var app in responseModel.data) {
        appointLst.add(Appointment.fromJson(app));
      }
    } else {
      CommonCode().showToast(message: responseModel.message);
    }
    return appointLst;
  }

  Future<List<Appointment>> getCompletedAppointmentsList() async {
    List<Appointment> appointLst = [];

    ResponseModel responseModel =  await _httpClient.getRequest(url: kGetCompletedAppointmentsURL);

    if (responseModel.message == "Success" && responseModel.data != null && responseModel.data.length > 0) {
      for (var app in responseModel.data) {
        appointLst.add(Appointment.fromJson(app));
      }
    } else {
      CommonCode().showToast(message: responseModel.message);
    }
    return appointLst;
  }

  Future<String> acceptAppointment({required String appId}) async {
    ResponseModel responseModel = await _httpClient.postRequest(
      url: kAcceptAppointmentURL,
      requestBody: {'appointmentId': appId},
      requireToken: true,
    );
    return responseModel.message;
  }

  Future<String> rejectAppointment({required String appId}) async {
    ResponseModel responseModel = await _httpClient.postRequest(
      url: kRejectAppointmentURL,
      requestBody: {'appointmentId': appId},
      requireToken: true,
    );
    return responseModel.message;
  }

  Future prescribeAppointmentRequestByID({
    required String appointmentId,
  }) async {
    ResponseModel responseModel = await _httpClient.postRequest(
      url: kAddPrescriptionURL,
      requestBody: /*TODO: */ {},
      requireToken: false,
    );
    if (responseModel.message == "Success" && responseModel.data != null) {
      //
    } else {
      // user.responseMessage = responseModel.message;
    }
    // return user;
  }
}
