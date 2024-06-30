import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utilities/constants.dart';
import '../../../utilities/responsive.dart';
import '../../../widgets/menu_item.dart';
import 'custom_menuItem.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key, this.page});
  final String? page;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: true,
      pinned: false,
      snap: true,
      backgroundColor: Colors.black,
      elevation: 2,
      scrolledUnderElevation: 2,
      flexibleSpace: Image.asset(
        "assets/images/bg_landing_frame.png",
        width: 1.sw,
        fit: BoxFit.cover,
      ),
      shadowColor: Colors.black,
      leadingWidth: Responsive.isDesktop(context) ? 400 : 80,
      toolbarHeight: Responsive.isDesktop(context) ? 80 : 60,
      leading: Padding(
          padding: EdgeInsets.only(
              left: Responsive.isDesktop(context) ? 90 : 20, top: 5),
          child: GestureDetector(
            onTap: () => Get.toNamed(Routes.HOME),
            child: Responsive(
                desktop: _getDesktopLeading(), mobile: _getMobileLeading()),
          )),
      centerTitle: true,
      title: ConstrainedBox(
          constraints: const BoxConstraints.expand(width: 500, height: 100),
          child: Responsive(
              desktop: _getDesktopTitle(), mobile: _getMobileTitle())),
      // actions: Responsive.isDesktop(context)
      //     ? [
      //         // CustomMenuItem(
      //         //     title: "About", selected: Get.currentRoute == Routes.ABOUT),
      //         // const SizedBox(width: 15),
      //         CustomMenuItem(
      //           title: "Contact Us",
      //           selected: Get.currentRoute == Routes.CONTACT,
      //           onTap: () => Get.toNamed(Routes.CONTACT),
      //         ),
      //         const SizedBox(width: 25),
      //         // joinNowButton(),
      //         // const SizedBox(width: 15)
      //       ]
      //     : []
    );
  }

  _getDesktopLeading() {
    return Row(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 70, maxWidth: 70),
          child: Image.asset(
              'assets/images/appbar_logo.png', // Replace with your logo image
              fit: BoxFit.contain),
        ),
        const SizedBox(width: 15),
        Text("Viridis Network",
            style: GoogleFonts.inter(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400))
      ],
    );
  }

  _getMobileLeading() {
    return IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.menu,
          color: Colors.white,
        ));
  }

  _getDesktopTitle() {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < menuConstants.length; i++)
          MenuItem(
              title: menuConstants[i].name,
              selected: widget.page == menuConstants[i].route,
              onPress: menuConstants[i].onTap),
      ],
    );
  }

  _getMobileTitle() {
    return Row(
      children: [
        const SizedBox(width: 15),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 40, maxWidth: 40),
          child: Image.asset(
              'assets/images/appbar_logo.png', // Replace with your logo image
              fit: BoxFit.contain),
        ),
        const SizedBox(width: 15),
        Text("Viridis Network", style: _getTitleStyle())
      ],
    );
  }

  _getTitleStyle() {
    if (Responsive.isDesktop(context)) {
      return GoogleFonts.inter(
          fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white);
    } else {
      return GoogleFonts.inter(
          fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white);
    }
  }

  Widget joinNowButton() {
    return Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        child: FilledButton(
            onPressed: () {},
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color(0xff4d2c5e)),
                padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 15, horizontal: 22))),
            child: Text("Join Now",
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Colors.white))));
  }
}
