import 'package:e_clinic/doctor_details_screen/widgets/doctor_service_type_widget.dart';
import 'package:get/get.dart';

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
