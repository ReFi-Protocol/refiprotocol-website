import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viridis_web/routes/app_pages.dart';
import 'package:viridis_web/views/Home/home_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:viridis_web/views/test/test_view.dart';

final List _allAsset = [
  "images/about_detail.png",
  "images/about_explore.jpeg",
  "images/about_frame_d.png",
  "images/about_frame_m.png",
  "images/blogs_intro-1.png",
  "images/blogs_intro-2.png",
  "images/blogs_intro-3.png",
  "images/blogs_intro-4.png",
  "images/bytebison.png",
  "images/tim.jpeg",
  "images/falcon.jpeg",
  "images/bg_landing_frame.png",
  "images/bg_contact_frame.png",
  "images/detail_1.png",
  "images/detail_2.png",
  "images/detail_3.png",
  "images/detail_4.png",
  "images/tab_1.png",
  "images/tab_2.png",
  "images/tab_3.png",
  "images/tab_4.png",
  "images/bg_transparency_frame.png",
  "images/mission_frame_d.png",
  "images/mission_frame_m.png",
  "images/roadmap_mobile.png",
  "images/roadmap.png",
  "images/vision_frame_d.png",
  "images/vision_frame_m.png",
  "images/logo.png",
  "images/wave_line.png",
];

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1280, 832),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            initialRoute: Routes.SPLASH,
            getPages: AppPages.routes,
            theme: ThemeData(
              primaryColor: Colors.black,
              dividerColor: Color(0xff484848),
              useMaterial3: true,
            ),
            // initialBinding: BindingsBuilder(() async {
            //   for (var asset in _allAsset) {
            //     await precacheImage(AssetImage(asset), context);
            //   }
            // }),
          );
        });
  }
}
