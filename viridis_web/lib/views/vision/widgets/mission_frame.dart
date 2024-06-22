import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viridis_web/widgets/FadeInListWidget.dart';

import '../../../utilities/responsive.dart';

class MissionFrame extends StatefulWidget {
  const MissionFrame({super.key, required this.controller});
  final ScrollController controller;

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
        child: Stack(
          children: [
            Positioned(top: 600, right: 0, child: _parallaxImage()),
            Padding(
                padding: getContainerPadding(),
                child:
                    Responsive(mobile: _mobileView(), desktop: _desktopView()))
          ],
        ));
  }

  _parallaxImage() {
    return AnimatedBuilder(
        animation: widget.controller,
        builder: (context, child) {
          double offsetY = -widget.controller.offset * 0.85;
          return Transform.translate(
            offset: Offset(0, offsetY),
            child: child,
          );
        },
        child: _background());
  }

  _background() {
    return Image.asset(
      "images/mission_bg.png",
      // fit: BoxFit.cover,
      // width: 1.sw,
      // height: 2.sh,
    );
  }

  _desktopView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
            flex: 8,
            child: Image.asset(
              "images/mission_frame_d.png",
              // height: 0.9.sh,
              fit: BoxFit.fitHeight,
            )),
        const Spacer(),
        Expanded(flex: 8, child: _textBody()),
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
              "images/mission_frame_d.png",
              // fit: BoxFit.cover,
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
                "Blockchain to build transparent, accessible, and fast infrastructure for environmental commodities.",
                style: Responsive.getTextStyle(context,
                    weight: FontWeight.w500, mSize: 35, dSize: 40),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Viridis enables carbon offset suppliers to register credits to our protocol, creating NFT carbon credits. These can be traded like ERC20 tokens on our chain and used by projects to become carbon neutral.",
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
