import 'package:get/get.dart';
import 'package:xuan_fu/app/modules/rent/rent_controller.dart';

class RentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RentController());
  }
}
