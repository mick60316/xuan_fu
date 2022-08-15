import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:xuan_fu/app/modules/rent/rent_controller.dart';
import 'package:xuan_fu/app/modules/rent/widget/car_status_view.dart';

class ReturnPage extends StatelessWidget {
  ReturnPage({Key? key}) : super(key: key);
  final controller = Get.find<RentController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.all(8),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '已租車輛：${controller.isRentCarCount}',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
          SizedBox(height: 20),
          CarStatusView(
              sourceLabel: '待還車輛',
              targetLabel: '欲還車輛',
              sourceList: controller.isRentCarList,
              targetList: controller.modifiedIsRentCarList),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  controller.returnCars();
                },
                child: Text('還車'),
              ),
            ],
          ),
        ]),
      );
    });
  }
}
