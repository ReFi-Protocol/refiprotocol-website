import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viridis_web/routes/app_pages.dart';

import 'menu_item.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key, this.page});
  final String? page;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
      color: Colors.black,
      child: Stack(alignment: AlignmentDirectional.center, children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 60, maxWidth: 60),
            child: Image.asset("images/logo.png"),
          ),
          SizedBox(
            width: 10,
          ),
          Text("Viridis Network",
              style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400))
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MenuItem(
                title: "Home",
                selected: widget.page == Routes.HOME,
                onPress: () => null),
            MenuItem(
                title: "Vision",
                selected: widget.page == Routes.VISION,
                onPress: () => null),
            MenuItem(
                title: "About us",
                selected: widget.page == Routes.ABOUT,
                onPress: () => null),
            MenuItem(
                title: "Whitepaper",
                selected: widget.page == Routes.WHITEPAPER,
                onPress: () => null),
            MenuItem(
                title: "Roadmaps",
                selected: widget.page == Routes.ROADMAPS,
                onPress: () => null)
          ],
        )
      ]),
    );
  }
}
