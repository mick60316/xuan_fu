import 'package:flutter/foundation.dart';
import 'package:get/get_navigation/src/routes/observers/route_observer.dart';

import 'pages.dart';

class MiddleWare {
  static observer(Routing? routing) {
    debugPrint('############Current routing: ${routing?.current}');
    if (routing?.current == Routes.main) {
      debugPrint('#### This is main');
    }
  }
}
