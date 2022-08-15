import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:xuan_fu/app/data/models/cars_info.dart';
import 'package:xuan_fu/app/data/providers/google_sheet_api_provider.dart';

class RentController extends GetxController {
  final googleSheetApiProvider = Get.find<GoogleSheetApiProvider>();
  final normalCarList = <String>[].obs;
  final modifiedCarList = <String>[].obs;
  final isRentCarList = <String>[].obs;
  final modifiedIsRentCarList = <String>[].obs;
  final unRentCarsCount = 0.obs;
  final isRentCarCount = 0.obs;
  final isLoading = false.obs;

  void moveCarFromTo(
      RxList<String> fromList, RxList<String> toList, String carNumber) {
    if (!fromList.contains(carNumber)) return;
    fromList.remove(carNumber);
    toList.add(carNumber);
  }

  void cleaModifiedList() {
    modifiedCarList.clear();
  }

  Future<void> initList() async {
    isLoading.value = true;
    final res = await googleSheetApiProvider.getAllCarsInfo();
    modifiedCarList.clear();
    normalCarList.clear();
    modifiedIsRentCarList.clear();
    isRentCarList.clear();
    unRentCarsCount.value = 0;
    isRentCarCount.value = 0;
    for (var element in res) {
      if (element.status != "出租中") {
        normalCarList.add(element.number.toString());
        unRentCarsCount.value++;
      } else {
        isRentCarList.add(element.number.toString());
        isRentCarCount.value++;
      }
    }
    isLoading.value = false;
  }

  Future<void> returnCars() async {
    isLoading.value = true;
    final res =
        await googleSheetApiProvider.returnCars(cars: modifiedIsRentCarList);
    if (res?.data['message'] == "ok") {
      initList();
    }
  }

  Future<void> rentCars(
      {required String name,
      required String returnTime,
      required String remark,
      required String money}) async {
    isLoading.value = true;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy年MM月dd日 – kk:mm').format(now);
    final res = await googleSheetApiProvider.rentCars(
        cars: modifiedCarList,
        name: name,
        currentTime: formattedDate,
        returnTime: returnTime,
        remark: remark,
        money: money);

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
