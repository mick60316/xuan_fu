import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:xuan_fu/app/data/providers/google_sheet_api_provider.dart';
import 'package:xuan_fu/app/modules/main_controller.dart';
import 'package:xuan_fu/app/modules/rent/rent_controller.dart';

class AppMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppMainController());
    Get.lazyPut(() => RentController());
    Get.put(GoogleSheetApiProvider());
  }
}
