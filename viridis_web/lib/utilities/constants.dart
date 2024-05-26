import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:viridis_web/utilities/menu_constant.dart';

import 'package:viridis_web/routes/app_pages.dart';

final List<MenuConstant> menuConstants = [
  MenuConstant(
    "Home",
    Routes.HOME,
    () => Get.toNamed(Routes.VISION),
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
  )
];

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

final List AssetConstants = [
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
