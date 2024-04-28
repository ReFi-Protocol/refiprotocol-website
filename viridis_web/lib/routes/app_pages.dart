import 'package:get/get.dart';
import 'package:viridis_web/views/home/home_view.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.HOME, page: () => const HomeView()),
  ];
}
