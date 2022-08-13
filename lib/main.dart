import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xuan_fu/app/modules/main_page.dart';
import 'package:xuan_fu/routes/middleware.dart';
import 'package:xuan_fu/routes/pages.dart';

import 'app/modules/rent/rent_page.dart';

void main() {
  runApp(AppPro());
}

class AppPro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.main,
      getPages: AppPages.rootPages,
      routingCallback: MiddleWare.observer,
    );
  }
}
