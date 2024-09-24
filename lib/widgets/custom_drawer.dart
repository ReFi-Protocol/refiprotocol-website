import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viridis_web/utilities/responsive.dart';
import 'package:viridis_web/widgets/cta_button.dart';

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
              const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                // IconButton(
                //     onPressed: () => Get.back(),
                //     icon: const Icon(
                //       Icons.close,
                //       color: Colors.white,
                //     ))
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  constraints:
                      const BoxConstraints(maxHeight: 33, maxWidth: 60),
                  child: Image.asset("assets/images/REFI_Logo.png"),
                ),
                SizedBox(
                  width: 25.w,
                ),
                Text("ReFi Protocol",
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
          for (int i = 0; i < menuConstants.length; i++)
            _menuListItem(
                menuConstants[i].name,
                menuConstants[i].route == Get.currentRoute,
                menuConstants[i].onTap),
          for (int i = 0; i < strategyMenuList.length; i++)
            _menuListItem(
                strategyMenuList[i].name,
                strategyMenuList[i].route == Get.currentRoute,
                strategyMenuList[i].onTap),
          const Divider(
            height: 50,
            indent: 50,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: ListTile(
              leading: const SizedBox(
                height: 0,
                width: 0,
              ),
              title: CTAButton(
                  filled: false,
                  onTap: () => launchUniSwapURL(),
                  child: const Text(
                    "\$REFI",
                    style: TextStyle(fontSize: 15),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: ListTile(
              leading: const SizedBox(
                height: 0,
                width: 0,
              ),
              title: CTAButton(
                  filled: true,
                  onTap: () => launchDashboardURL(),
                  child: const Text(
                    "Launch App",
                    style: TextStyle(fontSize: 15),
                  )),
            ),
          )
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
        splashColor: const Color(0xff12BB5F).withOpacity(0.2),
        onTap: onTap,
      ),
    );
  }
}
