import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:viridis_web/widgets/cta_button.dart';

import '../../../routes/app_pages.dart';
import '../../../utilities/responsive.dart';
import '../../../widgets/custom_appbar.dart';

class LandingFrame extends StatefulWidget {
  const LandingFrame({super.key, required this.controller});
  final ScrollController controller;

  @override
  State<LandingFrame> createState() => _LandingFrameState();
}

class _LandingFrameState extends State<LandingFrame>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  double maxHeight = 0;

  @override
  void initState() {
    maxHeight = (1.sh) > 500 ? 1.sh : 500;
    super.initState();
    _controller = AnimationController(
      duration: const Duration(minutes: 1),
      vsync: this,
    )..repeat(reverse: false);
    _animation = Tween<double>(begin: 1.0, end: 1.3).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastEaseInToSlowEaseOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(minHeight: 520),
        height: 1.sh,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: _parallaxImage(),
            ),
            _data()
          ],
        ));
  }

  _parallaxImage() {
    return AnimatedBuilder(
        animation: widget.controller,
        builder: (context, child) {
          double offsetY = -widget.controller.offset *
              (Responsive.isDesktop(context) ? 0.25 : 0.15);
          return Transform.translate(
            offset: Offset(0, offsetY),
            child: child,
          );
        },
        child: Container(
            constraints: const BoxConstraints(minHeight: 600),
            height: 1.2.sh,
            child: Image.asset(
              "images/bg_landing_frame.png",
              width: 1.sw,
              fit: BoxFit.cover,
            )));
  }

  _data() {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      const CustomAppBar(
        page: Routes.HOME,
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        constraints: const BoxConstraints(maxWidth: 650),
        child: Column(children: [
          Text(
            "Making 'Carbon Neutral' a Reality",
            textAlign: TextAlign.center,
            style: Responsive.getTextStyle(context,
                mSize: 35, dSize: 50, weight: FontWeight.w900),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "Seemlessly integrating Real World Assets (RWA) to support Regenerative Finance (ReFi)",
            textAlign: TextAlign.center,
            style: Responsive.getTextStyle(context),
          ),
          SizedBox(
            height: 60.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CTAButton(
                  filled: false,
                  onTap: () => Get.toNamed(Routes.VISION),
                  child: const Row(
                    children: [
                      Text(
                        "Explore",
                      ),
                      Icon(
                        Icons.chevron_right,
                        // color: Colors.white,
                      )
                    ],
                  )),
              SizedBox(
                width: 40.w,
              ),
              CTAButton(
                  filled: true,
                  onTap: () => Get.toNamed(Routes.CONTACT),
                  child: const Text(
                    "Contact us",
                  ))
            ],
          )
        ]),
      ),
    ]);
  }
}
