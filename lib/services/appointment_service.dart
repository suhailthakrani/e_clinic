/*Created By: Suhail Thakrani on 23-Sept-2023*/

import 'package:e_clinic/models/new_appointment_model.dart';
import 'package:e_clinic/services/service_urls.dart';

import '../models/appointment_model.dart';
import '../models/appointment_type.dart';

import '../models/general_models.dart';
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

  // Future getAppointmentsList() async {
  //   ResponseModel responseModel = await _httpClient.getRequest(url: kGetAppointmentsURL);

  //   if (responseModel.message == "Success" &&
  //       responseModel.data != null &&
  //       responseModel.data.length > 0) {
  //     //
  //   } else {
  //     CommonCode().showToast(message: responseModel.message);
  //   }
  //   //
  // }

  Future<List<Prescription>> getPrescriptionModelsList() async {
    List<Prescription> list1 = [];

    ResponseModel responseModel =
        await _httpClient.getRequest(url: kAddPrescriptionURL);

    if (responseModel.message == "Success" &&
        responseModel.data != null &&
        responseModel.data.length > 0) {
      for (var app in responseModel.data) {
        list1.add(Prescription.fromJson(app ?? {}));
      }
    } else {
      CommonCode().showToast(message: responseModel.message);
    }
    if (list1.isEmpty) {
      List<Prescription> dummy = [
        Prescription(
          id: '1',
          appointment: AppointmentModel(
            id: 'A123',
            date: DateTime(2023, 11, 4),
            time: '10:00',
            type: 'Follow-up',
            patientName: 'John Doe',
            message: 'Patient needs to discuss recent test results.',
            doctorId: 'D12345',
          ),
          appointmentId: 'A123',
          medication: [
            Medication(
              id: 'M1',
              medication: 'Aspirin',
              dosage: '500mg',
              instructions: 'Take with water',
              prescription: Prescription.empty(),
              prescriptionId: '',
            ),
            Medication(
              id: 'M2',
              medication: 'Ibuprofen',
              dosage: '200mg',
              instructions: 'Take after meals',
              prescription: Prescription.empty(),
              prescriptionId: '',
            ),
          ],
        ),
        Prescription(
          id: '2',
          appointment: AppointmentModel(
            id: 'A124',
            date: DateTime(2023, 11, 5),
            time: '11:30',
            type: 'Check-up',
            patientName: 'Jane Smith',
            message: 'Routine check-up appointment.',
            doctorId: 'D67890',
          ),
          appointmentId: 'A124',
          medication: [
            Medication(
              id: 'M3',
              medication: 'Paracetamol',
              dosage: '250mg',
              instructions: 'Take as needed',
              prescription: Prescription.empty(),
              prescriptionId: '',
            ),
          ],
        ),
        Prescription(
          id: '3',
          appointment: AppointmentModel(
            id: 'A125',
            date: DateTime(2023, 11, 6),
            time: '22:00',
            type: 'Follow-up',
            patientName: 'Sarah Johnson',
            message: 'Follow-up after recent surgery.',
            doctorId: 'D54321',
          ),
          appointmentId: 'A125',
          medication: [
            Medication(
              id: 'M4',
              medication: 'Antibiotic',
              dosage: '500mg',
              instructions: 'Take with food',
              prescription: Prescription.empty(),
              prescriptionId: '',
            ),
          ],
        )
      ];
      list1.addAll(dummy);
    }
    return list1;
  }

  Future<List<AppointmentModelNew>> getCompletedAppointmentModelsList() async {
    List<AppointmentModelNew> appointLst = [];

    ResponseModel responseModel = await _httpClient.getRequest(url: kGetAppointmentsURL);

    if (responseModel.message == "Success" &&
        responseModel.data != null &&
        responseModel.data.length > 0) {
      for (var app in responseModel.data) {
        appointLst.add(AppointmentModelNew.fromJson(app));
      }
    } else {
      CommonCode().showToast(message: responseModel.message);
    }
    return appointLst;
  }

  Future<ResponseModel> bookAppointment(
      {required AppointmentModel appointment}) async {
    ResponseModel responseModel = await _httpClient.postRequest(
      url: kBookAppointmentURL,
      requestBody: appointment.toJson(),
      requireToken: true,
    );
    return responseModel;
  }

  Future<ResponseModel> confrimPayment({required String appointmentId}) async {
    ResponseModel responseModel = await _httpClient.putRequest(
      url: kGetAppointmentsURL + appointmentId,
      requireToken: true,
    );
    return responseModel;
  }

  // Future<String> acceptAppointment({required String appId}) async {
  //   ResponseModel responseModel = await _httpClient.postRequest(
  //     url: kAcceptAppointmentURL,
  //     requestBody: {'appointmentId': appId},
  //     requireToken: true,
  //   );
  //   return responseModel.message;
  // }

  // Future<String> rejectAppointment({required String appId}) async {
  //   ResponseModel responseModel = await _httpClient.postRequest(
  //     url: kRejectAppointmentURL,
  //     requestBody: {'appointmentId': appId},
  //     requireToken: true,
  //   );
  //   return responseModel.message;
  // }

  // Future prescribeAppointmentRequestByID({
  //   required String appointmentId,
  // }) async {
  //   ResponseModel responseModel = await _httpClient.postRequest(
  //     url: kAddPrescriptionURL,
  //     requestBody: /*TODO: */ {},
  //     requireToken: false,
  //   );
  //   if (responseModel.message == "Success" && responseModel.data != null) {
  //     //
  //   } else {
  //     // user.responseMessage = responseModel.message;
  //   }
  //   // return user;
  // }
}
