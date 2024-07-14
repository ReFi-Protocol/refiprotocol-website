import 'package:chewie/chewie.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../routes/app_pages.dart';

class AssetController extends GetxController {
  late VideoPlayerController videoPlayerController1;

  late VideoPlayerController videoPlayerController2;

  late VideoPlayerController videoPlayerController3;

  @override
  Future<void> onInit() async {
    await load1();
    await load2();
    await load3();
    super.onInit();
  }

  load1() async {
    videoPlayerController1 =
        VideoPlayerController.asset("assets/images/windturbine.mp4");
    await videoPlayerController1.initialize();
    videoPlayerController1.setVolume(0);
    videoPlayerController1.setPlaybackSpeed(0.5);
  }

  load2() async {
    videoPlayerController2 =
        VideoPlayerController.asset("assets/images/hero_section_mobile.mp4");
    await videoPlayerController2.initialize();
    videoPlayerController2.setVolume(0);
    videoPlayerController2.setPlaybackSpeed(0.5);
  }

  load3() async {
    videoPlayerController3 =
        VideoPlayerController.asset("assets/images/hero_section.mp4");
    await videoPlayerController3.initialize();
    videoPlayerController3.setVolume(0);
    videoPlayerController3.setPlaybackSpeed(0.5);
  }
}
