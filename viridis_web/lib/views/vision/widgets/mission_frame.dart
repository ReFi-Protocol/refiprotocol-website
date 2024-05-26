import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utilities/responsive.dart';

class MissionFrame extends StatefulWidget {
  const MissionFrame({super.key});

  @override
  State<MissionFrame> createState() => _MissionFrameState();
}

class _MissionFrameState extends State<MissionFrame> {
  getContainerPadding() {
    if (Responsive.isDesktop(context)) {
      return const EdgeInsets.only(right: 120, left: 60, top: 60, bottom: 60);
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
        Expanded(
            flex: 6,
            child: Image.asset(
              "images/mission_frame_d.png",
              height: 1.1.sh,
              fit: BoxFit.fill,
            )),
        const Spacer(),
        Expanded(flex: 6, child: _textBody()),
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
              "images/mission_frame_m.png",
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
                "Our Mission",
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
                "Utilize blockchain technology to bring credibility to the Voluntary Carbon Market",
                style: Responsive.getTextStyle(context,
                    weight: FontWeight.w500, mSize: 35, dSize: 40),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Viridis Network’s mission is to improve the credibility of the Voluntary Carbon Market through anchoring carbon credits on our blockchain platform. With a robust and lucid workflow emphasizing transparency, Viridis Network aims to create the first decentralized network of Validation/Verification Bodies (VVBs) for the continuous verification of the environmental data supporting carbon credits.",
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
