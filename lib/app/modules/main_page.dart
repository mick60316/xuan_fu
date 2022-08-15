import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xuan_fu/app/modules/main_controller.dart';
import 'package:xuan_fu/app/modules/rent/rent_controller.dart';
import 'package:xuan_fu/app/modules/rent/rent_page.dart';
import 'package:xuan_fu/app/modules/return/return_page.dart';

class AppMainPage extends GetView<AppMainController> {
  final controller = Get.find<AppMainController>();
  final rentController = Get.find<RentController>();

  List<Widget> tabList = [
    Tab(text: '租車'),
    Tab(text: '還車'),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DefaultTabController(
        length: tabList.length,
        child: Scaffold(
            appBar: AppBar(
              title: Text('炫富租車'),
              bottom: TabBar(
                tabs: tabList,
                onTap: ((index) {
                  rentController.initList();
                }),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    controller.refreshButtonClick();
                  },
                  icon: Icon(Icons.refresh),
                )
              ],
            ),
            body: Stack(
              children: [
                TabBarView(
                  children: [RentPage(), ReturnPage()],
                ),
                rentController.isLoading.isTrue
                    ? Center(child: CircularProgressIndicator())
                    : Container(),
              ],
            )),
      );
    });
  }
}
