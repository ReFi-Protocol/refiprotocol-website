import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:viridis_web/routes/app_pages.dart';
import 'package:viridis_web/utilities/responsive.dart';

import '../utilities/constants.dart';
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
      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ))
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
        for (int i = 0; i < MenuItems.length; i++)
          MenuItem(
              title: MenuItems.keys.elementAt(i),
              selected: widget.page == MenuItems.values.elementAt(i),
              onPress: () {
                String route = MenuItems.values.elementAt(i);
                if (route == Routes.WHITEPAPER) {
                  launchWhitePaperURL();
                } else {
                  Get.toNamed(route);
                }
              }),
      ],
    );
  }
}
