// import 'package:e_clinic/models/doctor_model.dart';
// import 'package:e_clinic/services/doctors_service.dart';
// import 'package:get/get.dart';

// import '../../ui/widgets/ratings_card.dart';

// class DoctorsListController extends GetxController {
 
//   RxList<Doctor> doctorsList = RxList([]);
//   RxString specialization = ''.obs;

//   @override
//   Future<void> onInit() async {
//     Map<String, dynamic> arguments = Get.arguments??{};
//     if(arguments != null && arguments.isNotEmpty) {
//       specialization.value = arguments['specialization'] ??'';
//       doctorsList.value = await DoctorsService().getDoctorsListByCategory(specialization: specialization.value);
//     }
    
//     super.onInit();
//   }
// }
