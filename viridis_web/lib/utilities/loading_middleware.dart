import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/loader.dart';

class LoadingMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    Loader.show();
    // No redirection
    return null;
  }

  @override
  void onPageDispose() {
    super.onPageDispose();
    Loader.hide();
  }
}
