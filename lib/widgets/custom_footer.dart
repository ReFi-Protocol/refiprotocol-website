import 'package:flutter/material.dart';
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
        constraints: const BoxConstraints(
          maxHeight: 375,
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
        const Spacer(),
        _linksColumn(),
        const SizedBox(
          width: 60,
        ),
        _socialsColumn(),
        const SizedBox(
          width: 60,
        ),
      ],
    );
  }

  _body1() {
    return Expanded(
        flex: 2,
        child: _footerColumn("Mission",
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
                Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35)),
                    child: Text(
                      "CA: 0xa4bb712b4ea05e74a9590ec550bd922cd857afcb",
                      style: Responsive.getTextStyle(context,
                          mSize: 9,
                          dSize: 15,
                          mWeight: FontWeight.w400,
                          dWeight: FontWeight.w400,
                          textColor: Colors.black),
                    ))
              ],
            )));
  }

  _linksColumn() {
    return _footerColumn("Links",
        alignment: CrossAxisAlignment.start,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 1; i < 4; i++)
              _link(menuConstants[i].name, menuConstants[i].onTap),
            _link(
                "DEXTools",
                () => launchCustomURL(
                    "https://www.dextools.io/app/en/ether/pair-explorer/0x98c36dce8433dc89e91097b7cf1dafbe32922457?t=1721761810694")),
          ],
        ));
  }

  _socialsColumn() {
    return _footerColumn("Socials",
        alignment: CrossAxisAlignment.end,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _link("Twitter",
                () => launchCustomURL("https://x.com/refiprotocol_io")),
            _link("Telegram",
                () => launchCustomURL("https://t.me/ReFiProtocolCommunity")),
            _link("Medium",
                () => launchCustomURL("https://refiprotocol.medium.com/")),
            _link("Github",
                () => launchCustomURL("https://github.com/ReFi-Protocol")),
          ],
        ));
  }

  _footerColumn(String title,
      {Widget? child,
      CrossAxisAlignment alignment = CrossAxisAlignment.start}) {
    return Column(
      crossAxisAlignment: alignment,
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
