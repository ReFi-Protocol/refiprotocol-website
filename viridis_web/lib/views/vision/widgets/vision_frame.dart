import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utilities/responsive.dart';

class VisionFrame extends StatefulWidget {
  const VisionFrame({super.key});

  @override
  State<VisionFrame> createState() => _VisionFrameState();
}

class _VisionFrameState extends State<VisionFrame> {
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
              "images/vision_frame_d.png",
              height: 1.1.sh,
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
              "images/vision_frame_m.png",
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
                "Our Vision",
                style: Responsive.getTextStyle(context,
                    weight: FontWeight.w200, mSize: 20, dSize: 30),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Unlocking widespread climate impact",
                style: Responsive.getTextStyle(context,
                    weight: FontWeight.w500, mSize: 35, dSize: 40),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "With time running out to bridge the emissions gap, the voluntary carbon market is crucial. By building trust-enhancing infrastructure that boosts connections between supply and demand, and increases market transparency, we empower scalability. The technology is here— it's time to leverage it!",
                textAlign: TextAlign.justify,
                style: Responsive.getTextStyle(context,
                    weight: FontWeight.w400, mSize: 16, dSize: 20),
              ),
            ],
          ),
        )
      ],
    );
  }
}
