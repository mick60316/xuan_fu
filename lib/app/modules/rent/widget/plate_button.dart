import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:xuan_fu/app/modules/rent/rent_controller.dart';

class PlateButton extends StatefulWidget {
  PlateButton({Key? key, required this.plateNumber, required this.onClickEvent})
      : super(key: key);
  final String plateNumber;
  final Function onClickEvent;

  @override
  State<PlateButton> createState() => _PlateButtonState();
}

class _PlateButtonState extends State<PlateButton> {
  Color buttonColor = Colors.white;
  String name = "";
  @override
  void initState() {}

  @override
  void didChangeDependencies() {}

  @override
  Widget build(BuildContext context) {
    String color = widget.plateNumber.split(' ')[1];
    name = widget.plateNumber.split(' ')[0];
    switch (color) {
      case '紅':
        buttonColor = Colors.red;
        break;
      case '藍':
        buttonColor = Colors.blue;
        break;
      case '紫':
        buttonColor = Colors.deepPurpleAccent;
        break;
      case '灰':
        buttonColor = Colors.grey;
        break;
      case '白':
      default:
        buttonColor = Colors.white;
        break;
    }

    return GestureDetector(
      onTap: () {
        widget.onClickEvent.call();
      },
      child: Container(
          width: 100,
          decoration: new BoxDecoration(
              color: Colors.white, //new Color.fromRGBO(255, 0, 0, 0.0),
              borderRadius: new BorderRadius.all(Radius.circular(5))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(name, textAlign: TextAlign.center),
                Spacer(),
                Container(
                  width: 10,
                  height: 10,
                  color: buttonColor,
                )
              ],
            ),
          )),
    );
  }
}
