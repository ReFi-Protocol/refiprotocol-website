import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viridis_web/routes/app_pages.dart';

class SplashMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final args = Get.arguments;

    // Only show splash if no arguments or the flag is true
    if (args != null && args['noSplash'] == true) {
      return null;
    }
    return RouteSettings(
      name: Routes.SPLASH,
      arguments: route,
    );
  }
}
