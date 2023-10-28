import '/../utils/user_session.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/date_time_manager.dart';
import '../utils/dropdown_controller.dart';
import '../utils/text_field_manager.dart';
import '../utils/text_filter.dart';



class NotificationSettingsController extends GetxController {
  // Add your logic for the Notification Settings screen here
}

class PersonalInfoSettingsController extends GetxController {
  TextFieldManager firstNameController =
      TextFieldManager('First Name', length: 50, filter: TextFilter.name);
  TextFieldManager lastNameController =
      TextFieldManager('Last Name', length: 50, filter: TextFilter.name);
  TextFieldManager cniController =
      TextFieldManager('CNIC', length: 50, filter: TextFilter.number);
  DropdownController genderDDController = DropdownController(
    title: "Gender",
    items: ["MALE", "FEMALE"].obs,
  );
  RxString profileUrl = RxString('');

  @override
  Future<void> onInit() async {
    firstNameController.controller.text =
        await UserSession.userModel.value.firstName;
    lastNameController.controller.text =
        await UserSession.userModel.value.lastName;
    super.onInit();
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      profileUrl.value = image.path;
    } else {
      print('---------------------- [Unable to Pick Image!]');
    }
  }

  DateTimeManager dateOfBirthController = DateTimeManager("Date of Birth",
      firstDate: DateTime(DateTime.now().year - 80),
      lastDate: DateTime(
          DateTime.now().year - 18, DateTime.now().month, DateTime.now().day));
          
}

class EmailSettingsController extends GetxController {
  TextFieldManager currentEmailControler = TextFieldManager(
      'Current Email Address',
      length: 50,
      filter: TextFilter.email);
  TextFieldManager newEmailControler = TextFieldManager('New Email Address',
      length: 50, filter: TextFilter.email);
  TextFieldManager confrimEmailControler = TextFieldManager(
      'Confrim Email Address',
      length: 50,
      filter: TextFilter.email);
}

class PhoneNoSettingsController extends GetxController {
  TextFieldManager currentPhoneControler = TextFieldManager(
      'Current Phone Number',
      length: 50,
      filter: TextFilter.number);
  TextFieldManager newPhoneControler = TextFieldManager('New Phone Number',
      length: 50, filter: TextFilter.number);
  TextFieldManager confrimPhoneControler = TextFieldManager(
      'Confrim Phone Number',
      length: 50,
      filter: TextFilter.number);
}

class PasswordSettingsController extends GetxController {
  TextFieldManager currentPasswordControler = TextFieldManager(
      'Current Password',
      length: 50,
      filter: TextFilter.none);
  TextFieldManager newPasswordControler = TextFieldManager(
      'New Password',
      length: 50,
      filter: TextFilter.none);
  TextFieldManager confrimPasswordControler = TextFieldManager(
      'Confrim Password',
      length: 50,
      filter: TextFilter.none);
}
