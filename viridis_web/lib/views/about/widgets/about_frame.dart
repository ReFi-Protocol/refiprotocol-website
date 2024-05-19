import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utilities/responsive.dart';

class AboutFrame extends StatefulWidget {
  const AboutFrame({super.key});

  @override
  State<AboutFrame> createState() => _AboutFrameState();
}

class _AboutFrameState extends State<AboutFrame> {
  getContainerPadding() {
    if (Responsive.isDesktop(context)) {
      return const EdgeInsets.only(left: 120, right: 60, top: 60, bottom: 60);
    } else {
      return const EdgeInsets.symmetric(horizontal: 30, vertical: 30);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: Colors.black,
        ),
        padding: getContainerPadding(),
        child: Responsive(mobile: _mobileView(), desktop: _desktopView()));
  }

  _desktopView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(flex: 6, child: _textBody()),
        const Spacer(),
        Expanded(
            flex: 6,
            child: Image.asset(
              "images/about_frame_d.png",
              height: 1.sh,
              fit: BoxFit.fill,
            ))
      ],
    );
  }

  _mobileView() {
    return Column(
      children: [
        _textBody(),
        Container(
            padding: const EdgeInsets.only(left: 20, top: 20),
            width: 1.sw,
            child: Image.asset(
              "images/about_frame_m.png",
              fit: BoxFit.cover,
            ))
      ],
    );
  }

  _textBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 50.h),
          child: Row(
            children: [
              const VerticalDivider(
                width: 20,
                thickness: 4,
                color: Color(0xff07BA9B),
              ),
              Text(
                "About us",
                style: Responsive.getTextStyle(context,
                    weight: FontWeight.w200, mSize: 20, dSize: 30),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Text(
            "Viridis leverages Web3 technology to revolutionize the Voluntary Carbon Markets (VCM), addressing current issues of opacity, excessive intermediaries, and low liquidity. Our innovative solution aims to streamline capital flows, accelerating support for high-impact carbon mitigation and removal projects globally.",
            textAlign: TextAlign.justify,
            style: Responsive.getTextStyle(context,
                weight: FontWeight.w400, mSize: 16, dSize: 20),
          ),
        )
      ],
    );
  }
}
