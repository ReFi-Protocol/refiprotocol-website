import 'package:get/get.dart';
import 'package:viridis_web/utilities/loading_middleware.dart';
import 'package:viridis_web/views/about/about_view.dart';
import 'package:viridis_web/views/home/home_view.dart';
import 'package:viridis_web/views/splash/splash_view.dart';
import 'package:viridis_web/views/vision/vision_view.dart';

import '../views/test/test_view.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      title: "Splash",
      name: Routes.SPLASH,
      page: () => SplashView(),
    ),
    GetPage(
        title: "Home",
        name: Routes.HOME,
        page: () => const HomeView(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 400)),
    GetPage(
        title: "Vision",
        name: Routes.VISION,
        page: () => VisionView(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 400)),
    GetPage(
        title: "About",
        name: Routes.ABOUT,
        page: () => const AboutView(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 400)),
    // GetPage(
    //   title: "TEST",
    //   name: Routes.TEST,
    //   page: () => ExampleParallax(),
    //   // middlewares: [LoadingMiddleware()]
    // ),
    GetPage(
      title: "Roadmap",
      name: Routes.ROADMAPS,
      page: () => VisionView(
        roadmap: true,
      ),
    ),
  ];
}
