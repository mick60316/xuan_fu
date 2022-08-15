import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:xuan_fu/app/data/providers/google_sheet_api_provider.dart';
import 'package:xuan_fu/app/modules/rent/rent_controller.dart';
import 'package:xuan_fu/app/modules/rent/widget/car_list_view.dart';
import 'package:xuan_fu/app/modules/rent/widget/car_status_view.dart';

class RentPage extends GetView<RentController> {
  final timeInputController = TextEditingController();
  final nameInputController = TextEditingController();
  final remarkInputController = TextEditingController();
  final moneyInputController = TextEditingController();
  final apiProvider = Get.find<GoogleSheetApiProvider>();
  final controller = Get.find<RentController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '庫存車輛：${controller.unRentCarsCount}',
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
            SizedBox(height: 20),
            CarStatusView(
                sourceLabel: '待租車輛',
                targetLabel: '預租車輛',
                sourceList: controller.normalCarList,
                targetList: controller.modifiedCarList),
            SizedBox(height: 10),
            Container(
              width: 300,
              child: Column(
                children: [
                  TextField(
                    controller: timeInputController,
                    onTap: () {
                      timeInputController.text = '';
                      DatePicker.showDateTimePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(2018, 3, 5),
                          maxTime: DateTime(2019, 6, 7),
                          theme: const DatePickerTheme(
                              backgroundColor: Colors.blueAccent,
                              itemStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                              doneStyle:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                          onChanged: (date) {}, onConfirm: (date) {
                        String formattedDate =
                            DateFormat('yyyy年MM月dd日 – kk:mm').format(date);
                        timeInputController.text = formattedDate;
                      }, currentTime: DateTime.now(), locale: LocaleType.zh);
                    },
                    decoration: InputDecoration(labelText: '歸還日期'),
                  ),
                  TextField(
                    controller: nameInputController,
                    decoration: InputDecoration(labelText: '名字'),
                  ),
                  TextField(
                    controller: moneyInputController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: '金額'),
                  ),
                  TextField(
                    controller: remarkInputController,
                    decoration: InputDecoration(labelText: '備註'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    nameInputController.text = '';
                    timeInputController.text = '';
                    remarkInputController.text = '';
                    moneyInputController.text = '';
                  },
                  child: Text('清除'),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    controller.rentCars(
                        name: nameInputController.text,
                        returnTime: timeInputController.text,
                        remark: remarkInputController.text,
                        money: moneyInputController.text);
                  },
                  child: Text('送出'),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
