import 'package:get/get.dart';

import '../ui/screens/forgot_password/widgets/password_reset_method.dart';

class ForgetPasswordController extends GetxController {
  RxList<PasswordResetMethod> passwordResetMethods = [
    PasswordResetMethod(
      image: "assets/images/msg-icon.png",
      title: "Via SMS",
      subtitle: "+11 11*****11",
      selected: false,
    ),
    PasswordResetMethod(
      image: "assets/images/mail-icon.png",
      title: "Via Email",
      subtitle: "abc@gmail.com",
      selected: false,
    ),
  ].obs;

  void selectMethod(int index) {
    for (var element in passwordResetMethods) {
      element.selected = false;
    }
    passwordResetMethods[index].selected = true;
  }

  bool checkIfAllSelected() {
    for (var element in passwordResetMethods) {
      if (element.selected == true) {
        return true;
      }
    }
    return false;
  }
}
