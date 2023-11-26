import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:e_clinic/models/lab_model.dart';
import 'package:e_clinic/models/lab_test_model.dart';
import 'package:e_clinic/models/message_model.dart';
import 'package:e_clinic/models/new_lab_model.dart';
import 'package:e_clinic/models/response_model.dart';
import 'package:e_clinic/services/http_client.dart';
import 'package:e_clinic/services/service_urls.dart';
import 'package:e_clinic/utils/common_code.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/appointment_model.dart';
import '../models/new_appointment_model.dart';
import '../models/report_model.dart';

class LabService {
  static final LabService _instance = LabService._internal();

  factory LabService() => _instance;

  LabService._internal() {
    _httpClient = HTTPClient();
  }

  late HTTPClient _httpClient;


    Future<List<Report>> getReportsList() async {
    List<Report> list1 = [];

    ResponseModel responseModel = await _httpClient.getRequest(
      url: kLabGetLabURL,
      requireToken: true,
    );

    if (responseModel.message == "Success" && responseModel.data != null && responseModel.data.length > 0) {
      for (var app in responseModel.data['labs']??[]) {
        list1.add(Report.fromJson(app ?? {}));
      }
    } else {
      CommonCode().showToast(message: responseModel.message);
    }
    if (list1.isEmpty) {
      list1.add(Report(
        id: '1957ec35-6691-468b-acb6-159c3b4e1201',
        name: 'Bool Test Reports Example',
        testId: '1957ec35-6691-468b-acb6-159c3b4e1201',
        createdAt: '${DateTime.now()}',
      ));
     }
    
    return list1;
  }

  Future<List<LabModel>> getLabList() async {
    List<LabModel> list1 = [];

    ResponseModel responseModel = await _httpClient.getRequest(
      url: kLabGetLabURL,
      params: {'q': 'sah'},
    );

    if (responseModel.message == "Success" && responseModel.data != null && responseModel.data.length > 0) {
      for (var app in responseModel.data['labs']??[]) {
        list1.add(LabModel.fromJson(app ?? {}));
      }
    } else {
      CommonCode().showToast(message: responseModel.message);
    }
    if (list1.isEmpty) {
      list1.add(LabModel(
        password: '',
        email: '',
        id: '1957ec35-6691-468b-acb6-159c3b4e1201',
        name: 'Test Lab',
        address: 'Lab Adress Example for Checking Works Fine or not!',
        state: 'State',
        city: 'City',
      ));
      list1.add(LabModel(
        password: '',
        email: '',
        id: '1957ec35-6691-468b-acb6-159c3b4e1202',
        name: 'Test Lab 2',
        address: 'Lab Adress Example for Checking Works Fine or not!',
        state: 'State 2',
        city: 'City 2',
      ));
    }
    return list1;
  }

  Future<List<NewLabModel>> getTestList() async {
    List<NewLabModel> list1 = [];

    try {
      final response = await http.get(Uri.parse(kGetTestsURL), headers: await getHeaders());

      if (response.statusCode == 200 && response != null && response.body != null && response.body.isNotEmpty) {
        List<dynamic> data = (json.decode(response.body))??[];

        list1 = data.map((json) => NewLabModel.fromJson(json)).toList();
      } else {
        CommonCode().showToast(message: 'Data Not Found');
      }
    } on  TimeoutException catch (e) {
      CommonCode().showToast(message: e.toString());
    } on Exception catch (e) {
      CommonCode().showToast(message: e.toString());
    }
    if (list1.isEmpty) {
      list1.add(
        NewLabModel(
            id: '1',
            name: 'Blood Test',
            description: 'Checking blood parameters',
            labId: 'L001',
            patientId: 'P001',
            createdAt: DateTime.now(),
            lab: Lab(
                name: 'Lab',
                address: 'Lab Address',
                city: 'City',
                state: 'State')),
      );
    }
    return list1;
  }

  Future<String> bookTest(
      {required String test,
      required String labId,
      required String description}) async {
    ResponseModel responseModel = await _httpClient
        .postRequest(url: kBookTestURL, requireToken: true, requestBody: {
      'test': test,
      'labId': labId,
      'description': description,
    });


    return responseModel.message;
  }

  
  Future<String> uploadReport({required String url, required String testId}) async {
    ResponseModel responseModel = await _httpClient
        .postMultipartRequest(url: '${kAddReportToLabURL}/${testId}',  files: {
      'report': url,
    });

    return responseModel.message;
  }

  Future<List<NewLabModel>> getLabTestListForLab() async {
    List<NewLabModel> list1 = [];

    ResponseModel responseModel =
        await _httpClient.getRequest(url: kLabGetTestsURL);

    if (responseModel.message == "Success" &&
        responseModel.data != null &&
        responseModel.data.length > 0) {
      for (var app in responseModel.data['tests']??[]) {
        list1.add(NewLabModel.fromJson(app ?? {}));
      }
    } else {
      CommonCode().showToast(message: responseModel.message);
    }
    if (list1.isEmpty) {
      list1.add(NewLabModel(
        id: '1',
        name: 'Blood Test',
        description: 'Checking blood parameters',
        labId: 'L001',
        patientId: 'P001',
        createdAt: DateTime.now(),
        lab: Lab(
          name: 'Complete Blood Count',
          address: 'Address',
          city: 'City',
          state: 'State',
        ),
      ));
    }
    return list1;
  }


}
