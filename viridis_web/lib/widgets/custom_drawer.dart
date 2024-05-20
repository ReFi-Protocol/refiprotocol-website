import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viridis_web/routes/app_pages.dart';
import 'package:viridis_web/utilities/responsive.dart';

import '../utilities/constants.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  // late List<bool> menuHover;

  @override
  void initState() {
    // menuHover = List.filled(MenuItems.length, false);
    // for (int i = 0; i < MenuItems.length; i++) {
    //   if (MenuItems.values.elementAt(i) == Get.currentRoute) {
    //     menuHover[i] = true;
    //   }
    // }
    // MenuItems.values.firstWhere((element) => element == Get.currentRoute);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: const EdgeInsets.all(15),
        children: <Widget>[
          Stack(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ))
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxHeight: 60, maxWidth: 60),
                  child: Image.asset("images/logo.png"),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text("Viridis Network",
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400))
              ])
            ],
          ),
          SizedBox(
            height: 50.h,
          ),
          for (int i = 0; i < MenuItems.length; i++)
            _menuListItem(MenuItems.keys.elementAt(i),
                MenuItems.values.elementAt(i) == Get.currentRoute, () {
              String route = MenuItems.values.elementAt(i);
              if (route == Routes.WHITEPAPER) {
                launchWhitePaperURL();
              } else {
                Get.toNamed(route);
              }
            }),
        ],
      ),
    );
  }

  _menuListItem(String title, bool selected, Function() onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: selected
            ? const VerticalDivider(
                thickness: 4,
                width: 2,
                color: Color(0xff12BB5F),
              )
            : const SizedBox(
                height: 0,
                width: 0,
              ),
        title: Text(
          title,
          style: Responsive.getTextStyle(context,
              weight: selected ? FontWeight.w600 : FontWeight.w400,
              mSize: 18,
              dSize: 18,
              textColor: Colors.white),
        ),
        splashColor: const Color(0xff12BB5F),
        onTap: onTap,
      ),
    );
  }
}
