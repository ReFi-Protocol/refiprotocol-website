import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:viridis_web/routes/app_pages.dart';

import '../../utilities/constants.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  ValueNotifier<double> loadedAssetsPercentage = ValueNotifier(0);

  late AnimationController _controller;
  late Animation<double> _animation;
  late VideoPlayerController controller_landing_desktop;
  late VideoPlayerController controller_transparency_desktop;

  late VideoPlayerController controller_landing_mobile;
  late VideoPlayerController controller_transparency_mobile;

  // int factIndex = getRandomIntegrerInRange(0, 10);
  // int changeFactIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    ));
  }

  Future<bool> preloadImages(context) async {
    int totalAssets = (assetMap[Routes.HOME] ?? []).length;
    int loadedAssets = 0;

    for (String asset in assetMap[Routes.HOME] ?? []) {
      await precacheImage(AssetImage(asset), context);
      loadedAssets += 1;
      loadedAssetsPercentage.value = (loadedAssets / totalAssets);
      // await Future.delayed(Duration(milliseconds: 100));
    }
    controller_landing_desktop =
        VideoPlayerController.asset("assets/images/hero_section.mov")
          ..initialize();
    controller_transparency_desktop =
        VideoPlayerController.asset("assets/images/windturbine.mp4")
          ..initialize();
    // ..initialize().then((_) {
    //   // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //   setState(() {
    //     // controller_desktop.play();
    //     // _startPauseTimer();

    //     controller_desktop.setLooping(true);
    //     controller_desktop.setPlaybackSpeed(0.75);
    //   });
    // });

    controller_landing_mobile =
        VideoPlayerController.asset("assets/images/hero_section_mobile.mov")
          ..initialize();
    controller_transparency_mobile =
        VideoPlayerController.asset("assets/images/windturbine_mobile.mov")
          ..initialize();
    // ..initialize().then((_) {
    //   // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //   setState(() {
    //     // controller_mobile.play();
    //     // _startPauseTimer();

    //     controller_mobile.setLooping(true);
    //     controller_mobile.setPlaybackSpeed(0.75);
    //   });
    // });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: preloadImages(context),
          builder: (context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.data == true) {
              WidgetsBinding.instance.addPostFrameCallback(
                (_) {
                  Get.toNamed(Routes.HOME, arguments: {
                    "controller_desktop": controller_landing_desktop,
                    "controller_mobile": controller_landing_mobile
                  });
                  // Get.toNamed(nextRoute);
                },
              );
            }
            return Container(
              height: 1.sh,
              width: 1.sw,
              color: Colors.black,
              child: Center(
                  child: Stack(
                children: [
                  Center(
                    child: SizedBox(
                      height: 200.h,
                      width: 200.w,
                      child: AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: _animation.value,
                            child: child,
                          );
                        },
                        child: Image.asset("assets/images/REFI_Logo.png"),
                      ),
                    ),
                  ),
                  // Align(
                  //   alignment: Alignment.bottomRight,
                  //   child: ValueListenableBuilder(
                  //     valueListenable: loadedAssetsPercentage,
                  //     builder: (context, value, child) {
                  //       return CircularProgressIndicator(
                  //         value: value,
                  //         backgroundColor: Colors.black,
                  //         color: Colors.white,
                  //       );
                  //     },
                  //   ),
                  // )
                ],
              )),
            );
          }),
    );
  }
}
