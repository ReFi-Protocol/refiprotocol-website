import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:viridis_web/utilities/constants.dart';
import 'package:viridis_web/utilities/responsive.dart';
import 'package:viridis_web/widgets/cta_button.dart';

import '../routes/app_pages.dart';

class CustomFooter extends StatefulWidget {
  const CustomFooter({super.key});

  @override
  State<CustomFooter> createState() => _CustomFooterState();
}

class _CustomFooterState extends State<CustomFooter> {
  getContainerPadding() {
    if (Responsive.isDesktop(context)) {
      return const EdgeInsets.all(65);
    } else {
      return const EdgeInsets.symmetric(horizontal: 15, vertical: 30);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: getContainerPadding(),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Responsive(
          mobile: mobileView(),
          desktop: desktopView(),
        ),
        Divider(
          height: 60.h,
          color: const Color(0xff484848),
        ),
        Row(
          children: [
            const Icon(
              Icons.copyright,
              color: Colors.white,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text("ReFi Protocol. All rights reserved",
                style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white))
          ],
        )
      ]),
    );
  }

  mobileView() {
    return Container(
        constraints: BoxConstraints(
          maxHeight: 360,
        ),
        child: Column(
          children: [
            _body1(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _linksColumn(),
                _socialsColumn(),
              ],
            ),
          ],
        ));
  }

  desktopView() {
    return Row(
      children: [
        _body1(),
        Spacer(),
        _linksColumn(),
        _socialsColumn(),
        Spacer(),
      ],
    );
  }

  _body1() {
    return _footerColumn("Mission",
        flex: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "ReFi is the world's first protocol to tokenize any carbon project from afforestation to renewables, eliminating the need for carbon credits. Our innovative approach enhances transparency, reduces fraud, and ensures that environmental efforts are genuinely impactful",
                style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
            SizedBox(
              height: 15.h,
            ),
            CTAButton(
                filled: true,
                onTap: () => Get.toNamed(Routes.CONTACT),
                child: const Text(
                  "Contact us",
                ))
          ],
        ));
  }

  _linksColumn() {
    return _footerColumn("Links",
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 1; i < menuConstants.length; i++)
              _link(menuConstants[i].name, menuConstants[i].onTap),
          ],
        ));
  }

  _socialsColumn() {
    return _footerColumn("Socials",
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _link("Twitter", () async {
              Uri url = Uri.parse('https://twitter.com/ViridisNetwork');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                throw 'Could not launch $url';
              }
            }),
            _link("Telegram", () async {
              Uri url = Uri.parse('https://t.me/ViridisNetwork');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                throw 'Could not launch $url';
              }
            })
          ],
        ));
  }

  _footerColumn(String title, {Widget? child, int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
          SizedBox(
            height: 15.h,
          ),
          child ?? Container()
        ],
      ),
    );
  }

  _link(String text, Function() onTap) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Text(text,
          style: GoogleFonts.inter(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)),
    );
  }
}
