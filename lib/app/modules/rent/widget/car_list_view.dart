import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:xuan_fu/app/modules/rent/rent_controller.dart';
import 'package:xuan_fu/app/modules/rent/widget/plate_button.dart';

class CarListView extends StatefulWidget {
  const CarListView(
      {Key? key,
      required this.isModified,
      required this.sourceList,
      required this.backgroundColor,
      required this.targetList})
      : super(key: key);
  final bool isModified;
  final RxList<String> sourceList;
  final RxList<String> targetList;
  final Color backgroundColor;
  @override
  State<CarListView> createState() => _CarListViewState();
}

class _CarListViewState extends State<CarListView> {
  final controller = Get.find<RentController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final carList = widget.sourceList;
      return Container(
        color: widget.backgroundColor,
        // color: widget.isModified
        //     ? Color.fromRGBO(255, 198, 204, 1)
        //     : Color.fromRGBO(181, 239, 194, 1),
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
                          onClickEvent: () {
                            controller.moveCarFromTo(widget.sourceList,
                                widget.targetList, carList[index]);
                          },
                        ),
                      ),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: carList.length)),
        ),
      );
    });
  }
}
