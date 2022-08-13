import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:xuan_fu/app/data/models/cars_info.dart';
import 'package:xuan_fu/app/data/providers/google_sheet_api_provider.dart';

class RentController extends GetxController {
  final googleSheetApiProvider = Get.find<GoogleSheetApiProvider>();
  final normalCarList = <String>[].obs;
  final modifiedCarList = <String>[].obs;
  final unRentCarsCount = 0.obs;
  final isLoading = false.obs;

  void changeCarStatusToModified(String carNumber) {
    if (!normalCarList.contains(carNumber)) return;
    normalCarList.remove(carNumber);
    modifiedCarList.add(carNumber);
  }

  void changeCarStatusToNormal(String carNumber) {
    if (!modifiedCarList.contains(carNumber)) return;
    modifiedCarList.remove(carNumber);
    normalCarList.add(carNumber);
  }

  void cleaModifiedList() {
    modifiedCarList.clear();
  }

  Future<void> initList() async {
    final res = await googleSheetApiProvider.getAllCarsInfo();
    modifiedCarList.clear();
    normalCarList.clear();
    unRentCarsCount.value = 0;
    for (var element in res) {
      if (element.status != "出租中") {
        normalCarList.add(element.number.toString());
        unRentCarsCount.value++;
      }
    }
    isLoading.value = false;
  }

  Future<void> rentCars(
      {required String name,
      required String returnTime,
      required String remark}) async {
    isLoading.value = true;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy年MM月dd日 – kk:mm').format(now);
    final res = await googleSheetApiProvider.rentCars(
        cars: modifiedCarList,
        name: name,
        currentTime: formattedDate,
        returnTime: returnTime,
        remark: remark);

    if (res?.data['message'] == "ok") {
      initList();
    }
  }

  @override
  void onInit() {
    super.onInit();
    initList();
  }
}
