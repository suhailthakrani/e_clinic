import 'package:e_clinic/address_screen/widgets/address_card_item.dart';
import 'package:get/get.dart';

class AddrescardController extends GetxController {
  RxList<AddressCardItem> addressItems = [
    AddressCardItem(title: "Home", selected: false),
    AddressCardItem(title: "Apartment", selected: false),
    AddressCardItem(title: "Suite", selected: false),
  ].obs;

  void selectAddressItem(int index) {
    for (var item in addressItems) {
      item.selected = false;
    }
    addressItems[index].selected = true;
  }
}
