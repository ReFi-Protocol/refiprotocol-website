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
  MenuConstant(
    "Vision",
    Routes.VISION,
    () => Get.toNamed(Routes.VISION),
  ),
  MenuConstant(
    "Dashboard",
    Routes.DASHBOARD,
    () => Get.toNamed(Routes.DASHBOARD),
  ),
  MenuConstant(
    "Newsletter",
    Routes.NEWSLETTER,
    () => launchNewsletterURL(),
  ),
];

List<MenuConstant> strategyMenuList = [
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
  )
];

const CA_CODE = "0xa4bb712b4ea05e74a9590ec550bd922cd857afcb";

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

void launchDashboardURL() async {
  Uri url = Uri.parse('https://beta.refiprotocol.io');
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

void launchNewsletterURL() async {
  Uri url = Uri.parse('http://newsletter.refiprotocol.io');
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
    "assets/images/bg_contact_frame.png",
    "assets/images/bg_transparency_frame.png",
    "assets/images/detail_1.png",
    "assets/images/detail_2.png",
    "assets/images/detail_4.png",
    "assets/images/tab_2.png",
    "assets/images/tab_3.png",
    "assets/images/nft_image.png",
  ],
  // Routes.VISION: [
  //   "assets/images/mission_frame_d.png",
  //   "assets/images/mission_frame_m.png",
  //   "assets/images/roadmap_mobile.png",
  //   "assets/images/roadmap.png",
  //   "assets/images/vision_frame_d.png",
  //   "assets/images/vision_frame_m.png",
  // ],
  // Routes.CONTACT: [
  //   "assets/images/gradients.png",
  // ]
};

// VideoPlayerController videoController =
//     VideoPlayerController.asset("videos/hero_section.mov");
