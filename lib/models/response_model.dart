/*Created By: Amjad Jamali on 15-Aug-2023*/

class ResponseModel {
  String message = "";
  dynamic data ="";

  ResponseModel();
  ResponseModel.named({required this.message, this.data});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    message = '${json["message"]??""}';
    data = json["data"];
  }

  @override
  String toString() {
    return 'ResponseModel{message: $message, data: $data}';
  }
}
