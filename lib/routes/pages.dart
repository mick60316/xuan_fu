import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:xuan_fu/app/modules/main_binding.dart';
import 'package:xuan_fu/app/modules/main_page.dart';

part 'routes.dart';

abstract class AppPages {
  static final rootPages = [
    GetPage(
      name: Routes.main,
      page: () => AppMainPage(),
      popGesture: false,
      bindings: [
        AppMainBinding(),
      ],
    ),
  ];
}
