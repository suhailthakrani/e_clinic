import '/../utils/user_session.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/date_time_manager.dart';
import '../utils/dropdown_controller.dart';
import '../utils/text_field_manager.dart';
import '../utils/text_filter.dart';

class ProfessionalInfoSettingsController extends GetxController {
  TextFieldManager specializationController = TextFieldManager('Specialization', length: 50, filter: TextFilter.name);
  TextFieldManager lastNameController =
      TextFieldManager('Last Name', length: 50, filter: TextFilter.name);
  TextFieldManager cniController =
      TextFieldManager('CNIC', length: 50, filter: TextFilter.number);
  DropdownController experienceDDController = DropdownController(
    title: "Exprience",
    items: [
      'SELECT',
      '6 Months'
          '1 Year',
      '2 Years',
      '3 Years',
      '4 Years',
      '5 Years',
      '6 Years',
      'Or More'
    ].obs,
  );
  TextFieldManager hospitalNameController =
      TextFieldManager('Hospital Name', length: 50, filter: TextFilter.name);
  TextFieldManager addressController =
      TextFieldManager('Address', length: 50, filter: TextFilter.name);
  TextFieldManager cityController =
      TextFieldManager('City', length: 50, filter: TextFilter.name);
  TextFieldManager stateController =
      TextFieldManager('State', length: 50, filter: TextFilter.name);

  RxBool freeOfCost = false.obs;
  RxBool customCost = false.obs;

  void selectCheckBox1() {
    freeOfCost.value = true;
    customCost.value = false;
  }

  void selectCheckBox2() {
    freeOfCost.value = false;
    customCost.value = true;
  }
}

class PasswordResetMethodsController extends GetxController {
  // Add your logic for the Password Reset Methods screen here
}

class ResetPasswordBySMSController extends GetxController {
  // Add your logic for the Reset Password by SMS screen here
}

class VerificationIDController extends GetxController {
  // Add your logic for the Verification ID screen here
}

class VerificationDriverController extends GetxController {
  // Add your logic for the Verification Driver screen here
}

class VerificationPassportController extends GetxController {
  // Add your logic for the Verification Passport screen here
}

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
      'Current Password Number',
      length: 50,
      filter: TextFilter.none);
  TextFieldManager newPasswordControler = TextFieldManager(
      'New Password Number',
      length: 50,
      filter: TextFilter.none);
  TextFieldManager confrimPasswordControler = TextFieldManager(
      'Confrim Password Number',
      length: 50,
      filter: TextFilter.none);
}
