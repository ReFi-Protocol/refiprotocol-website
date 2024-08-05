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
        child: Stack(
          children: [
            Positioned(top: 0, left: 0, child: _parallaxImage()),
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
          double offsetY = -widget.controller.offset *
              (Responsive.isDesktop(context) ? 0.8 : 0.8);
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
            child: Image.asset(
              "assets/images/vision_frame_d.png",
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
              "assets/images/vision_frame_m.png",
              fit: BoxFit.cover,
            ))
      ],
    );
  }

  _textBody() {
    return FadeInListItem(
        child: Column(
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
                "As time runs short to bridge the emissions gap, the carbon market is crucial. By building trust-enhancing infrastructure that boosts connections between supply and demand, and increases market transparency, we empower scalability. The technology is here—it's time to use it.",
                textAlign: TextAlign.justify,
                style: Responsive.getTextStyle(context,
                    weight: FontWeight.w400, mSize: 16, dSize: 20),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
