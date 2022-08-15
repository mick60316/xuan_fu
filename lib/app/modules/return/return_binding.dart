import 'package:get/get.dart';
import 'package:xuan_fu/app/modules/return/return_controller.dart';

class ReturnBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReturnControlle);
  }
}
