import '../../verification_screen/widgets/id_type_widget.dart';
import 'package:get/get.dart';

class IdVerificationController extends GetxController {
  RxList<IdTypeWidget> idTypes = [
    IdTypeWidget(text: 'Driver', selected: false),
    IdTypeWidget(text: 'Passport', selected: false),
    IdTypeWidget(text: 'ID', selected: false),
  ].obs;

  void selectIdType(int index) {
    for (var item in idTypes) {
      item.selected = false;
    }
    idTypes[index].selected = true;
  }
}
