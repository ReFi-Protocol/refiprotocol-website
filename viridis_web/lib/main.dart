import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viridis_web/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
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
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.SPLASH,
            getPages: AppPages.routes,
            theme: ThemeData(
              primaryColor: Colors.black,
              dividerColor: Color(0xff484848),
              useMaterial3: true,
            ),
          );
        });
  }
}
