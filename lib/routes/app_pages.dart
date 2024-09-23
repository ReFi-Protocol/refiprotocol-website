import 'package:get/get.dart';
import 'package:viridis_web/views/application/application_view.dart';
import 'package:viridis_web/views/contact/contact_view.dart';
import 'package:viridis_web/views/home/home_view.dart';
import 'package:viridis_web/views/splash/splash_view.dart';
import 'package:viridis_web/views/vision/vision_view.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      title: "Splash",
      name: Routes.SPLASH,
      page: () => const SplashView(),
    ),
    GetPage(
        title: "Home",
        name: Routes.HOME,
        page: () => const HomeView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 400)),
    GetPage(
        title: "Vision",
        name: Routes.VISION,
        page: () => const VisionView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 400)),
    GetPage(
        title: "Dashboard",
        name: Routes.DASHBOARD,
        page: () => const ApplicationView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 400)),
    GetPage(
        title: "Contact",
        name: Routes.CONTACT,
        page: () => const ContactView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 400)),
  ];
}
