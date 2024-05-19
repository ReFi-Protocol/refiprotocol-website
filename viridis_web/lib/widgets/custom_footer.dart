import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viridis_web/utilities/responsive.dart';
import 'package:viridis_web/widgets/cta_button.dart';

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
      color: Colors.black,
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
            Text("Viridis Network. All rights reserved",
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
          maxHeight: 320.h,
        ),
        child: Column(
          children: [
            _body1(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _footerColumn("Links",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _link("Viridis", () {}),
                        _link("About", () {}),
                      ],
                    )),
                _footerColumn("Socials",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _link("Twitter", () {}),
                        _link("Telegram", () {})
                      ],
                    ))
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
        _footerColumn("Links",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _link("Viridis", () {}),
                _link("About", () {}),
              ],
            )),
        _footerColumn("Socials",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [_link("Twitter", () {}), _link("Telegram", () {})],
            )),
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
                "Viridis Network is a blockchain platform that enhances the credibility of the Voluntary Carbon Market by anchoring carbon offsets on an EVM-compatible  L1",
                style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
            SizedBox(
              height: 15.h,
            ),
            CTAButton(
              filled: true,
              child: Text(
                "Contact us",
                style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            )
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
      child: Text(text,
          style: GoogleFonts.inter(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)),
    );
  }
}
