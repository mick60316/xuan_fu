import 'package:get/get.dart';
import 'package:xuan_fu/app/modules/rent/rent_controller.dart';

class AppMainController extends GetxController {
  final rentController = Get.find<RentController>();
  void refreshButtonClick() {
    rentController.initList();
  }
}
