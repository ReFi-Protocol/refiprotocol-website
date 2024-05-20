import 'package:url_launcher/url_launcher.dart';

import '../routes/app_pages.dart';

final Map<String, String> MenuItems = {
  "Home": Routes.HOME,
  "Vision": Routes.VISION,
  "About": Routes.ABOUT,
  "Whitepaper": Routes.WHITEPAPER,
  "Roadmap": Routes.ROADMAPS
};

void launchWhitePaperURL() async {
  Uri url = Uri.parse('https://whitepaper.viridis.network/');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
