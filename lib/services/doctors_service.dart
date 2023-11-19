
import 'dart:math';

import '../models/doctor_model.dart';
import '../services/service_urls.dart';

import '../models/response_model.dart';
import '../utils/common_code.dart';
import 'http_client.dart';

class DoctorsService {
  late HTTPClient _httpClient;

  DoctorsService._internal() {
    _httpClient = HTTPClient();
  }

  factory DoctorsService() {
    return _instance;
  }
  static final DoctorsService _instance = DoctorsService._internal();

  // Future getDoctorById({required String drID}) async {
  //   ResponseModel responseModel = await _httpClient.getRequest(url: kGetDoctorsURL+drID);
 
  //   if (responseModel.message == "Success" && responseModel.data != null && responseModel.data.length > 0) {
  //     //
  //   } else{
  //     CommonCode().showToast(message: responseModel.message);
  //   }
  //   //
  // }
   Future<List<Doctor>> getDoctorsList({String id = ''}) async {

    ResponseModel responseModel = await _httpClient.getRequest(url: kGetDoctorsURL);
    List<Doctor> doctorList = [];

    if (responseModel.message == "Success" && responseModel.data != null && responseModel.data.length > 0) {

      for (var data in (responseModel.data['doctors']??[])) {
        doctorList.add(Doctor.fromJson(data));
      }
    } else{
      CommonCode().showToast(message: responseModel.message);
    }
    return doctorList;
  }

  Future<List<Doctor>> getDoctorsListByCategory({String specialization= 'Cardo'}) async {
    print("------------------${specialization}");
    ResponseModel responseModel = await _httpClient.getRequest(url: kGetDoctorsURL, params: {'specialization': specialization});
    List<Doctor> doctorList = [];

    if (responseModel.message == "Success" && responseModel.data != null && responseModel.data.length > 0) {

      for (var data in (responseModel.data['doctors']??[])) {
        doctorList.add(Doctor.fromJson(data));
      }
    } else{
      CommonCode().showToast(message: responseModel.message);
    }
    return doctorList;
  }
  Future<List<String>> getSpecializationList() async {

    ResponseModel responseModel = await _httpClient.getRequest(url: kDoctorsSpeializationURL);
    List<String> doctorList = [];

    if (responseModel.message == "Success" && responseModel.data != null && responseModel.data.length > 0) {

      for (var data in (responseModel.data['specializations']??[])) {
        doctorList.add(data);
      }
    } else{
      CommonCode().showToast(message: responseModel.message);
    }
    return doctorList;
  }

   Future getSpeializations() async {
    ResponseModel responseModel = await _httpClient.getRequest(url: kDoctorsSpeializationURL);
 
    if (responseModel.message == "Success" && responseModel.data != null && responseModel.data.length > 0) {
      //
    } else{
      CommonCode().showToast(message: responseModel.message);
    }
    //
  }

  Future getDoctorScheduleByDRId({required String drID}) async {
    ResponseModel responseModel = await _httpClient.getRequest(url: "$kGetDoctorsURL$drID/schedule/");
 
    if (responseModel.message == "Success" && responseModel.data != null && responseModel.data.length > 0) {
      //
    } else{
      CommonCode().showToast(message: responseModel.message);
    }
    //
  }
  
   Future getDoctorTimeSlotByDRId({required String drID}) async {
    ResponseModel responseModel = await _httpClient.getRequest(url: "$kGetDoctorsURL$drID/timeSlots/");
 
    if (responseModel.message == "Success" && responseModel.data != null && responseModel.data.length > 0) {
      //
    } else{
      CommonCode().showToast(message: responseModel.message);
    }
    //
  }

}
