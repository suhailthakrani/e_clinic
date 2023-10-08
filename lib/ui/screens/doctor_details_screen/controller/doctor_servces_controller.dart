import 'package:get/get.dart';

import '../widgets/doctor_service_type_widget.dart';

class DoctorServiceController extends GetxController {
  RxList<DoctorServiceTypeWidget> services = [
    DoctorServiceTypeWidget(
      serviceName: "Online Consult",
      isSelected: true,
    ),
    DoctorServiceTypeWidget(
      serviceName: "Appointment",
      isSelected: false,
    ),
  ].obs;

  void selectService(int index) {
    for (var element in services) {
      element.isSelected = false;
    }
    services[index].isSelected = true;
  }
}
