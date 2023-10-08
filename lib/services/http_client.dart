/*Created By: Suhail Thakrani  on 22-Sept-2023*/

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../models/response_model.dart';
import '../models/token_model.dart';
import '../ui/widgets/custom_dialogs.dart';
import '../ui/widgets/custom_progress_dialog.dart';
import '../utils/common_code.dart';
import '../utils/constants.dart';
import '../utils/user_session.dart';

class HTTPClient extends GetConnect {
  HTTPClient._internal();
  factory HTTPClient() {
    return _instance;
  }
  static const int _requestTimeOut = 300;
  static final HTTPClient _instance = HTTPClient._internal();

  Future<ResponseModel> postRequest(
      {required String url,
      dynamic requestBody,
      bool requireToken = true}) async {
    if (!(await CommonCode().checkInternetConnection())) {
      return Future.value(
          ResponseModel.named(message: kNoInternetMsg, data: kNoInternetMsg));
    }

    try {
      Response response = await post(
        url,
        requestBody != null ? FormData(requestBody) : null,
        headers: requireToken ? await _getHeaders() : null,
      ).timeout(const Duration(seconds: _requestTimeOut));

      log('───────────────────POST> $requestBody');
      log('───────────────────POST> $url\n${response.body}');

      if (response.unauthorized) {
        return Future.value(
          ResponseModel.named(message: "Invalid Credentials", data: []),
        );
      }
      log(response.statusText.toString());

      ResponseModel responseModel = ResponseModel.fromJson(
          response.body is Map ? response.body : jsonDecode(response.body));
      return responseModel;
    } on TimeoutException {
      return Future.value(ResponseModel.named(
          message: "Request TimeOut", data: kPoorInternetConnection));
    } catch (e) {
      if (!(await CommonCode().checkInternetAccess())) {
        return Future.value(ResponseModel.named(
            message: kPoorInternetConnection, data: kPoorInternetConnection));
      }
      log(e.toString());
      return Future.value(ResponseModel.named(
          message: 'Ups Something Went Wrong!', data: e.toString()));
    }
  }

  Future<ResponseModel> getRequest(
      {required String url,
      Map<String, String> params = const {},
      bool requireToken = true}) async {
    if (params.isNotEmpty) {
      log('───────────────────Get> $params');
      url = '$url?';
      for (MapEntry<String, String> p in params.entries) {
        url = '$url${p.key}=${p.value}&';
      }
      url = url.substring(0, url.length - 1);
    }
    log('───────────────────Get> $url');

    try {
      if (!(await CommonCode().checkInternetConnection())) {
        return Future.value(
            ResponseModel.named(message: kNoInternetMsg, data: kNoInternetMsg));
      }

      Response response =
          await get(url, headers: requireToken ? await _getHeaders() : null)
              .timeout(const Duration(seconds: _requestTimeOut));
      log('───────────────────Get> $url\n${response.body}');

      ResponseModel responseModel = ResponseModel.fromJson(
          response.body is Map ? response.body : jsonDecode(response.body));
      return responseModel;
    } on TimeoutException {
      return Future.value(ResponseModel.named(
          message: "Request TimeOut", data: kPoorInternetConnection));
    } on SocketException {
      return Future.value(
          ResponseModel.named(message: "Bad Request", data: kNetworkError));
    } catch (e) {
      if (!(await CommonCode().checkInternetAccess())) {
        return Future.value(ResponseModel.named(
            message: kPoorInternetConnection, data: kPoorInternetConnection));
      }
      return Future.value(
          ResponseModel.named(message: kNetworkError, data: kNetworkError));
    }
  }

  Future<ResponseModel> postMultipartRequest(
      {required String url,
      Map<String, String> fields = const {},
      Map<String, String> files = const {}}) async {
    if (!(await CommonCode().checkInternetConnection())) {
      return Future.value(
          ResponseModel.named(message: kNoInternetMsg, data: kNoInternetMsg));
    }
    try {
      // Map<String, String> customHeader = await _getHeaders();
      // customHeader['Connection'] = 'keep-alive';
      // customHeader['Accept'] = 'application/json';
      // customHeader['Content-Type'] = 'multipart/form-data';
      http.MultipartRequest request =
          http.MultipartRequest('POST', Uri.parse(url));

      // request.headers.addAll(customHeader);
      request.fields.addAll(fields);

      for (MapEntry<String, String> file in files.entries) {
        String type = file.value.substring(file.value.lastIndexOf('.') + 1);
        String name = file.value.substring(file.value.lastIndexOf('/') + 1);
        request.files.add(await http.MultipartFile.fromPath(
          file.key,
          file.value,
          filename: name,
          contentType: MediaType('file', type),
        ));
      }

      http.StreamedResponse streamedResponse = await request.send();
      http.Response httpResponse =
          await http.Response.fromStream(streamedResponse);
      print('────────────────────url> $url');
      print('────────────────────files> $files');
      print('────────────────────fields> $fields');
      print('────────────────────Response.body> ${httpResponse.body}');
      ResponseModel response =
          ResponseModel.fromJson(jsonDecode(httpResponse.body));
      return Future.value(response);
    } on TimeoutException {
      return Future.value(ResponseModel.named(
          message: "Request TimeOut", data: "Request TimeOut"));
    } on SocketException {
      return Future.value(
          ResponseModel.named(message: "Bad Request", data: "Bad Request"));
    } catch (e) {
      if (!(await CommonCode().checkInternetAccess())) {
        return Future.value(ResponseModel.named(
            message: kPoorInternetConnection, data: kPoorInternetConnection));
      }
      log('---------------------------${e.toString()}');
      return Future.value(
          ResponseModel.named(message: 'ERROR', data: e.toString()));
    }
  }

  Future<ResponseModel> putRequest(
      {required String url,
      dynamic requestBody,
      bool requireToken = true}) async {
    if (!(await CommonCode().checkInternetConnection())) {
      return Future.value(
          ResponseModel.named(message: kNoInternetMsg, data: kNoInternetMsg));
    }

    try {
      Map<String, String> customHeader = await _getHeaders();
      customHeader['Content-Type'] = 'application/json';

      http.Response response = await http.put(
        Uri.parse(url),
        body: requestBody,
        headers: customHeader,
      );

      log('───────────────────POST> $requestBody');
      log('───────────────────POST> $url\n${response.body}');

      ResponseModel responseModel = ResponseModel.fromJson(
          response.body is Map ? response.body : jsonDecode(response.body));
      return responseModel;
    } on TimeoutException {
      return Future.value(ResponseModel.named(
          message: "Request TimeOut", data: kPoorInternetConnection));
    } catch (e) {
      if (!(await CommonCode().checkInternetAccess())) {
        return Future.value(ResponseModel.named(
            message: kPoorInternetConnection, data: kPoorInternetConnection));
      }
      log(e.toString());
      return Future.value(ResponseModel.named(
          message: 'Ups Something Went Wrong!', data: e.toString()));
    }
  }
}

Future<Map<String, String>> _getHeaders() async {
  TokenModel? token = await UserSession().getToken();
  if (token.isExpired) {
    if (ProgressDialog().isOpened) {
      ProgressDialog().dismissDialog();
    }
    await UserSession().logout();
    CustomDialogs().showDialog('Alert', kSessionExpireMsg, DialogType.warning,
        onOkBtnPressed: () {
      Get.offAllNamed(kLoginScreenRoute);
    });
    return {};
  }

  if (token.accessToken.isNotEmpty) {
    print('----------------------------______________________');
    return {'X-Auth-Token': token.accessToken};
    // return {'Authorization': 'Bearer ${token.accessToken}'};
  } else {
    print('\______________________');

    return {};
  }
}
