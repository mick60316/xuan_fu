import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:xuan_fu/routes/middleware.dart';
import 'package:xuan_fu/routes/pages.dart';
import 'package:window_size/window_size.dart';

void main() {
  if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
    setWindowTitle('My App');
    setWindowMaxSize(const Size(1082, 500));
    setWindowMinSize(const Size(1082, 500));
  }
  // 1792 x 828
  runApp(AppPro());
}

class AppPro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.main,
      getPages: AppPages.rootPages,
      routingCallback: MiddleWare.observer,
    );
  }
}
