import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:viridis_web/utilities/menu_constant.dart';

import 'package:viridis_web/routes/app_pages.dart';

final List<MenuConstant> menuConstants = [
  MenuConstant(
    "Home",
    Routes.HOME,
    () => Get.toNamed(Routes.HOME),
  ),
  MenuConstant(
    "Vision",
    Routes.VISION,
    () => Get.toNamed(Routes.VISION),
  ),
  MenuConstant(
    "About",
    Routes.ABOUT,
    () => Get.toNamed(Routes.ABOUT),
  ),
  MenuConstant(
    "Whitepaper",
    Routes.WHITEPAPER,
    () => launchWhitePaperURL(),
  ),
  MenuConstant(
    "Roadmap",
    Routes.ROADMAPS,
    () => launchRoadmapsURL(),
  ),
  // MenuConstant(
  //   "Test",
  //   Routes.TEST,
  //   () => Get.toNamed(Routes.TEST),
  // )
];

void launchCustomURL(String customUrl) async {
  Uri url = Uri.parse(customUrl);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

void launchWhitePaperURL() async {
  Uri url = Uri.parse('https://whitepaper.viridis.network/');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

void launchRoadmapsURL() async {
  Uri url = Uri.parse('https://docs.viridis.network/roadmap/roadmap');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

void launchMediumURL() async {
  Uri url = Uri.parse('https://medium.com/@viridisnetwork');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

void launchDocsURL() async {
  Uri url = Uri.parse(
      'https://docs.viridis.network/overview/carbon-credit-architecture');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

final Map<String, List<String>> assetMap = {
  Routes.HOME: [
    // "videos/hero_section.mov",
    "assets/images/hero_bg.png",
    "assets/images/logo.png",
    "assets/images/appbar_logo.png",
    "assets/images/bg_landing_frame.png",
    "assets/images/bg_contact_frame.png",
    "assets/images/bg_transparency_frame.png",
    "assets/images/detail_1.png",
    "assets/images/detail_2.png",
    "assets/images/detail_3.png",
    "assets/images/detail_4.png",
    "assets/images/tab_1.png",
    "assets/images/tab_2.png",
    "assets/images/tab_3.png",
  ],
  Routes.VISION: [
    "assets/images/mission_frame_d.png",
    "assets/images/mission_frame_m.png",
    "assets/images/roadmap_mobile.png",
    "assets/images/roadmap.png",
    "assets/images/vision_frame_d.png",
    "assets/images/vision_frame_m.png",
  ],
  Routes.ABOUT: [
    "assets/images/about_detail.png",
    "assets/images/about_explore.jpeg",
    "assets/images/about_frame_d.png",
    "assets/images/about_frame_m.png",
    "assets/images/blogs_intro-1.png",
    "assets/images/blogs_intro-2.png",
    "assets/images/blogs_intro-3.png",
    "assets/images/blogs_intro-4.png",
    "assets/images/blogs_intro-5.png",
    "assets/images/blogs_intro-6.png",
    "assets/images/blogs_intro-7.png",
    "assets/images/blogs_intro-8.png",
    "assets/images/bytebison.png",
    "assets/images/tim.jpeg",
    "assets/images/falcon.jpeg",
    "assets/images/wave_line.png",
    // "assets/hvideos/ero_section.mov",
    // "assets/videos/windturbine.mp4"
  ],
  Routes.CONTACT: [
    "assets/images/gradients.png",
  ]
};

// VideoPlayerController videoController =
//     VideoPlayerController.asset("videos/hero_section.mov");
