import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utilities/responsive.dart';
import '../../../widgets/FadeInListWidget.dart';

class VisionFrame extends StatefulWidget {
  const VisionFrame({super.key, required this.controller});
  final ScrollController controller;

  @override
  State<VisionFrame> createState() => _VisionFrameState();
}

class _VisionFrameState extends State<VisionFrame> {
  getContainerPadding() {
    if (Responsive.isDesktop(context)) {
      return const EdgeInsets.only(left: 120, right: 60, top: 40, bottom: 40);
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
            Positioned(top: -50, left: 0, child: _parallaxImage()),
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
          double offsetY = widget.controller.offset * 0.08;
          return Transform.translate(
            offset: Offset(0, offsetY),
            child: child,
          );
        },
        child: _background());
  }

  _background() {
    return Image.asset(
      "assets/images/vision_bg.png",
      // fit: BoxFit.cover,
      // width: 1.sw,
      // height: 2.sh,
    );
  }

  _desktopView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(flex: 6, child: _textBody()),
        const Spacer(),
        Expanded(
            flex: 6,
            child: FadeInListItem(
                startPos: -0.05,
                child: Image.asset(
                  "assets/images/mission_frame_d.png",
                  height: 1.1.sh,
                  fit: BoxFit.fill,
                )))
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
              "assets/images/mission_frame_d.png",
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
                "Unlocking climate impact",
                style: Responsive.getTextStyle(context,
                    weight: FontWeight.w500, mSize: 35, dSize: 40),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "The current carbon markets don’t work efficiently. We are attempting to solve climate change from a new angle by funding carbon reduction and removal directly. Our infrastructure is decentralised to allow transparency and scalability. The technology is here - it’s time to use it",
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
