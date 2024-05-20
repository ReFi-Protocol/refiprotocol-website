import 'package:get/get.dart';
import 'package:viridis_web/utilities/loading_middleware.dart';
import 'package:viridis_web/views/about/about_view.dart';
import 'package:viridis_web/views/home/home_view.dart';
import 'package:viridis_web/views/vision/vision_view.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
        title: "Home",
        name: Routes.HOME,
        page: () => const HomeView(),
        middlewares: [LoadingMiddleware()]),
    GetPage(
        title: "Vision",
        name: Routes.VISION,
        page: () => VisionView(),
        middlewares: [LoadingMiddleware()]),
    GetPage(
        title: "About",
        name: Routes.ABOUT,
        page: () => const AboutView(),
        middlewares: [LoadingMiddleware()]),
    GetPage(
        title: "Roadmap",
        name: Routes.ROADMAPS,
        page: () => VisionView(
              roadmap: true,
            ),
        middlewares: [LoadingMiddleware()]),
  ];
}
