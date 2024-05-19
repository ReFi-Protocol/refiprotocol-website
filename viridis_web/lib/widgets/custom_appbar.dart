import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:viridis_web/routes/app_pages.dart';
import 'package:viridis_web/utilities/responsive.dart';

import 'menu_item.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key, this.page});
  final String? page;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  getContainerPadding() {
    if (Responsive.isDesktop(context)) {
      return const EdgeInsets.symmetric(horizontal: 60, vertical: 15);
    } else {
      return const EdgeInsets.symmetric(horizontal: 20, vertical: 15);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getContainerPadding(),
      color: Colors.transparent,
      child: Responsive(mobile: _mobileView(), desktop: _desktopView()),
    );
  }

  _mobileView() {
    return Stack(alignment: AlignmentDirectional.center, children: [
      const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Icon(
          Icons.menu,
          color: Colors.white,
        )
      ]),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [_title()])
    ]);
  }

  _desktopView() {
    return Stack(alignment: AlignmentDirectional.center, children: [
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [_title()]),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [_menuRow()])
    ]);
  }

  _title() {
    return Row(children: [
      ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 60, maxWidth: 60),
        child: Image.asset("images/logo.png"),
      ),
      SizedBox(
        width: 10.w,
      ),
      Text("Viridis Network",
          style: GoogleFonts.inter(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400))
    ]);
  }

  void _launchWhitePaperURL() async {
    Uri url = Uri.parse('https://whitepaper.viridis.network/');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _menuRow() {
    return Row(
      children: [
        MenuItem(
            title: "Home",
            selected: widget.page == Routes.HOME,
            onPress: () => Get.toNamed(Routes.HOME)),
        MenuItem(
            title: "Vision",
            selected: widget.page == Routes.VISION,
            onPress: () => Get.toNamed(Routes.VISION)),
        MenuItem(
            title: "About us",
            selected: widget.page == Routes.ABOUT,
            onPress: () => Get.toNamed(Routes.ABOUT)),
        MenuItem(
            title: "Whitepaper",
            selected: widget.page == Routes.WHITEPAPER,
            onPress: () => _launchWhitePaperURL()),
        MenuItem(
            title: "Roadmaps",
            selected: widget.page == Routes.ROADMAPS,
            onPress: () => Get.toNamed(Routes.ROADMAPS))
      ],
    );
  }
}
