import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:xuan_fu/app/modules/rent/rent_controller.dart';

import 'car_list_view.dart';

class CarStatusView extends StatelessWidget {
  CarStatusView(
      {Key? key,
      required this.sourceList,
      required this.targetList,
      required this.sourceLabel,
      required this.targetLabel})
      : super(key: key);
  final String sourceLabel;
  final String targetLabel;
  final RxList<String> sourceList;
  final RxList<String> targetList;

  final controller = Get.find<RentController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              sourceLabel,
              style: TextStyle(fontSize: 20),
            ),
            CarListView(
              backgroundColor: Color.fromRGBO(181, 239, 194, 1),
              isModified: false,
              sourceList: sourceList,
              targetList: targetList,
            )
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              targetLabel,
              style: TextStyle(fontSize: 20),
            ),
            CarListView(
              backgroundColor: Color.fromRGBO(255, 198, 204, 1),
              isModified: true,
              sourceList: targetList,
              targetList: sourceList,
            )
          ],
        )
      ],
    );
  }
}
