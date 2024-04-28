import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viridis_web/routes/app_pages.dart';
import 'package:viridis_web/views/Home/home_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return GetMaterialApp(
            initialRoute: Routes.HOME,
            getPages: AppPages.routes,
            theme: ThemeData(
              primaryColor: Colors.black,
              useMaterial3: true,
            ),
            home: HomeView(),
          );
        });
  }
}
