import 'package:get/get.dart';

import '../../utils/date_time_manager.dart';
import '../../utils/dropdown_controller.dart';
import '../../utils/text_field_manager.dart';
import '../../utils/text_filter.dart';

class WriteReportScreenController extends GetxController {
  TextFieldManager patientNameController = TextFieldManager('Patient Name', length: 50, filter: TextFilter.none);
  TextFieldManager patientNumberController = TextFieldManager('Phone Number', length: 50, filter: TextFilter.number);
  TextFieldManager ageController = TextFieldManager('Ager', length: 2, filter: TextFilter.number);
  
  TextFieldManager medicalHistoryController = TextFieldManager('Medical History', length: 50, filter: TextFilter.none);


  TextFieldManager diagnosis1Controller = TextFieldManager('Diagnosis 1', length: 50, filter: TextFilter.none);
  TextFieldManager diagnosis2Controller = TextFieldManager('Diagnosis 2', length: 50, filter: TextFilter.none);
  TextFieldManager diagnosis3Controller = TextFieldManager('Diagnosis 3', length: 50, filter: TextFilter.none);
  TextFieldManager diagnosis4Controller = TextFieldManager('Diagnosis 4', length: 50, filter: TextFilter.none);
  
  DropdownController genderDDController = DropdownController(
    title: "Gender",
    items: ["MALE", "FEMALE"].obs,
  );
  DateTimeManager dateOfBirthController = DateTimeManager("Date of Birth",
    firstDate: DateTime(DateTime.now().year - 80),
    lastDate: DateTime(DateTime.now().year - 18, DateTime.now().month, DateTime.now().day),
  );
}