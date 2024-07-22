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
  const CustomAppBar({super.key, this.bgColor = Colors.transparent, this.page});
  final Color bgColor;
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
    return PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: Container(
          padding: getContainerPadding(),
          color: widget.bgColor,
          child: Responsive(mobile: _mobileView(), desktop: _desktopView()),
        ));
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
    return InkWell(
      onTap: () => Get.toNamed(Routes.HOME),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Row(children: [
        Container(
          constraints: const BoxConstraints(maxHeight: 35, maxWidth: 60),
          child: Image.asset("assets/images/REFI_Logo.png"),
        ),
        SizedBox(
          width: 25.w,
        ),
        Text("ReFi Protocol",
            style: GoogleFonts.inter(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400))
      ]),
    );
  }

  _menuRow() {
    return Row(
      children: [
        for (int i = 0; i < menuConstants.length; i++)
          MenuItem(
              title: menuConstants[i].name,
              selected: widget.page == menuConstants[i].route,
              onPress: menuConstants[i].onTap),
      ],
    );
  }
}
