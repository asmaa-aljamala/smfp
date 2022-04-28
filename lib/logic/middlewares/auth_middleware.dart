import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:smfp/main.dart';
import 'package:smfp/routes/routes.dart';

class AuthMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (sharedPreferences.getString('id') != null &&
        sharedPreferences.getString('password') != null) {
      return const RouteSettings(name: Routes.childrenScreen);
    }
    return null;
  }
}
