
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

  Future getDoctorById({required String drID}) async {
    ResponseModel responseModel = await _httpClient.getRequest(url: kGetDoctorsURL+drID);
 
    if (responseModel.message == "Success" && responseModel.data != null && responseModel.data.length > 0) {
      //
    } else{
      CommonCode().showToast(message: responseModel.message);
    }
    //
  }
   Future getDoctorsList() async {

    ResponseModel responseModel = await _httpClient.getRequest(url: kGetDoctorsURL);
 
    if (responseModel.message == "Success" && responseModel.data != null && responseModel.data.length > 0) {
      //
    } else{
      CommonCode().showToast(message: responseModel.message);
    }
    //
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
