import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:viridis_web/utilities/menu_constant.dart';

import 'package:viridis_web/routes/app_pages.dart';

final List<MenuConstant> menuConstants = [
  MenuConstant(
    "Home",
    Routes.HOME,
    () => Get.toNamed(Routes.HOME),
  ),
  // MenuConstant(
  //   "Vision",
  //   Routes.VISION,
  //   () => Get.toNamed(Routes.VISION),
  // ),
  // MenuConstant(
  //   "About",
  //   Routes.ABOUT,
  //   () => Get.toNamed(Routes.ABOUT),
  // ),
  MenuConstant(
    "Whitepaper",
    Routes.WHITEPAPER,
    () => launchWhitePaperURL(),
  ),
  MenuConstant(
    "Tokenomics",
    Routes.TOKENOMICS,
    () => launchTokenomicsURL(),
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

void launchUniSwapURL() async {
  Uri url = Uri.parse(
      'https://app.uniswap.org/explore/tokens/ethereum/0xa4bb712b4ea05e74a9590ec550bd922cd857afcb');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

void launchAmazonURL() async {
  Uri url = Uri.parse('https://http://amazon.refiprotocol.io');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

void launchWhitePaperURL() async {
  Uri url = Uri.parse(
      'https://drive.google.com/file/d/1mZ78jEMlZO5NXZIheWt4fSKnCtgSIy6L/view');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

void launchTokenomicsURL() async {
  Uri url = Uri.parse(
      'https://drive.google.com/file/d/1zG_UP5L5j-6lIeRrZ9eqqVRQ__XVXNUj/view');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

void launchRoadmapsURL() async {
  Uri url = Uri.parse('https://docs.refiprotocol.io/roadmap/roadmap');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

void launchMediumURL() async {
  Uri url = Uri.parse('https://refiprotocol.medium.com/');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

void launchDocsURL() async {
  Uri url = Uri.parse('https://docs.refiprotocol.io/');
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
    "assets/images/REFI_Logo.png",
    "assets/images/WebsiteLogoRefi.png",
    "assets/images/appbar_logo.png",
    "assets/images/bg_landing_frame.png",
    "assets/images/bg_contact_frame.png",
    "assets/images/bg_transparency_frame.png",
    "assets/images/detail_1.png",
    "assets/images/detail_2.png",
    // "assets/images/detail_3.png",
    "assets/images/detail_4.png",
    // "assets/images/tab_1.png",
    "assets/images/tab_2.png",
    "assets/images/tab_3.png",
    "assets/images/nft_image.png",
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
