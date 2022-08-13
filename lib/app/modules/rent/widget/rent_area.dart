import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:xuan_fu/app/modules/rent/rent_controller.dart';
import 'package:xuan_fu/app/modules/rent/widget/plate_button.dart';

class RentArea extends StatefulWidget {
  const RentArea({Key? key, required this.isModified}) : super(key: key);
  final bool isModified;
  @override
  State<RentArea> createState() => _RentAreaState();
}

class _RentAreaState extends State<RentArea> {
  final controller = Get.find<RentController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final carList = widget.isModified
          ? controller.modifiedCarList
          : controller.normalCarList;
      return Container(
        color: widget.isModified
            ? Color.fromRGBO(255, 198, 204, 1)
            : Color.fromRGBO(181, 239, 194, 1),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              width: 125,
              height: 250,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 3),
                        child: PlateButton(
                          plateNumber: carList[index],
                          isModified: widget.isModified,
                        ),
                      ),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: carList.length)),
        ),
      );
    });
  }
}
