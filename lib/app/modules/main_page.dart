import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xuan_fu/app/modules/main_controller.dart';
import 'package:xuan_fu/app/modules/rent/rent_page.dart';

class AppMainPage extends GetView<AppMainController> {
  final controller = Get.find<AppMainController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('炫富租車'),
        actions: [
          IconButton(
            onPressed: () {
              controller.refreshButtonClick();
            },
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      body: RentPage(),
    );
  }
}
