import 'package:get/get.dart';
import 'package:viridis_web/utilities/loading_middleware.dart';
import 'package:viridis_web/utilities/splash_middleware.dart';
import 'package:viridis_web/views/about/about_view.dart';
import 'package:viridis_web/views/contact/contact_view.dart';
import 'package:viridis_web/views/home/home_view.dart';
import 'package:viridis_web/views/splash/splash_view.dart';
import 'package:viridis_web/views/test/test_view.dart';
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
        // middlewares: [SplashMiddleware()],
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 400)),
    GetPage(
        title: "Vision",
        name: Routes.VISION,
        page: () => VisionView(),
        // middlewares: [SplashMiddleware()],
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 400)),
    GetPage(
        title: "About",
        name: Routes.ABOUT,
        page: () => const AboutView(),
        // middlewares: [SplashMiddleware()],
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 400)),
    GetPage(
      title: "TEST",
      name: Routes.TEST,
      page: () => TestScreen(),
      // middlewares: [LoadingMiddleware()]
    ),
    GetPage(
      title: "Roadmap",
      name: Routes.ROADMAPS,
      page: () => VisionView(
        roadmap: true,
      ),
    ),
    GetPage(
        title: "Contact",
        name: Routes.CONTACT,
        page: () => const ContactView(),
        // middlewares: [SplashMiddleware()],
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 400)),
  ];
}
