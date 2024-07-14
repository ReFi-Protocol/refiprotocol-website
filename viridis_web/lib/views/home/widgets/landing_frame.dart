import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viridis_web/views/home/widgets/video_widget.dart';
import 'package:viridis_web/widgets/cta_button.dart';

import '../../../routes/app_pages.dart';
import '../../../utilities/constants.dart';
import '../../../utilities/responsive.dart';
import '../../../widgets/FadeInListWidget.dart';
import '../../../widgets/custom_appbar.dart';
import 'custom_Clipper.dart';

class LandingFrame extends StatefulWidget {
  const LandingFrame({super.key, required this.controller});
  final ScrollController controller;

  @override
  State<LandingFrame> createState() => _LandingFrameState();
}

class _LandingFrameState extends State<LandingFrame>
    with TickerProviderStateMixin {
  bool _comet = false;
  bool _bg = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 3), () {
      _bg = true;
    });
    Future.delayed(const Duration(seconds: 3), () {
      _toggleImage();
    });
  }

  void _toggleImage() {
    setState(() {
      _comet = !_comet;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
                image: AssetImage("assets/images/hero_bg.png"))),
        constraints: const BoxConstraints(minHeight: 520),
        height: Responsive.isDesktop(context) ? 1.25.sh : 650,
        width: 1.sw,
        child: Stack(
          children: [
            Center(
                child: AnimatedScale(
              scale: !_bg ? 1 : 2,
              duration: const Duration(minutes: 2),
              child: Image.asset(
                "assets/images/hero_bg.png",
              ),
            )),
            Center(
              child: _data(),
            ),
            _getAnimatedCommet(),
            Align(
              alignment: Alignment.bottomCenter,
              child: _getVideo(),
            )
          ],
        ));
  }

  _getVideo() {
    return Responsive(
        mobile: const VideoWidget(
            videoUrl: "assets/images/hero_section_mobile.mp4"),
        desktop: Container(
          constraints: BoxConstraints(maxHeight: 0.8.sh),
          child: ClipPath(
            clipper: CurvedClipper(),
            child:
                const VideoWidget(videoUrl: "assets/images/hero_section.mp4"),
          ),
        ));
  }

  _data() {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      const CustomAppBar(
        page: Routes.HOME,
      ),
      AnimatedBuilder(
          animation: widget.controller,
          builder: (context, child) {
            double offsetY = widget.controller.offset *
                (Responsive.isDesktop(context) ? 0.3 : 0.15);
            return Transform.translate(
              offset: Offset(0, offsetY),
              child: child,
            );
          },
          child: FadeInListItem(
              duration: const Duration(seconds: 1),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
                constraints: BoxConstraints(maxWidth: 850),
                child: Column(children: [
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "First Tokenization Framework For ",
                            style: Responsive.getTextStyle(context,
                                mSize: 30, dSize: 50, weight: FontWeight.w900)),
                        TextSpan(
                            text: "any",
                            style: Responsive.getTextStyle(context,
                                mSize: 30,
                                dSize: 50,
                                weight: FontWeight.w900,
                                // decoration: TextDecoration.underline,
                                decorationColor: Colors.white)),
                        TextSpan(
                            text: " Carbon Projects",
                            style: Responsive.getTextStyle(context,
                                mSize: 30, dSize: 50, weight: FontWeight.w900)),
                      ])),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Deploying carbon projects from forests to windfarms as RWAs to grow ReFi",
                    textAlign: TextAlign.center,
                    style: Responsive.getTextStyle(context, mSize: 18),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CTAButton(
                          filled: false,
                          onTap: () => launchRoadmapsURL(),
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
              ))),
    ]);
  }

  bool _disappear = false;
  _getAnimatedCommet() {
    if (!Responsive.isDesktop(context)) _disappear = true;
    return _disappear
        ? Container()
        : AnimatedContainer(
            // height: 500,
            // width: 500,
            onEnd: () {
              setState(() {
                _disappear = true;
              });
            },
            alignment: !_comet ? Alignment.topRight : Alignment.centerLeft,
            duration: const Duration(seconds: 1),
            child: AnimatedSwitcher(
              duration: const Duration(seconds: 2),
              switchInCurve: Curves.decelerate,
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: AnimatedOpacity(
                opacity: !_comet ? 0 : 1,
                duration: const Duration(seconds: 1),
                child: !_comet
                    ? SvgPicture.asset(
                        'assets/images/initial_star.svg',
                        key: const ValueKey(1),
                      )
                    : SvgPicture.asset(
                        'assets/images/final_star.svg',
                        key: const ValueKey(2),
                      ),
              ),
            ));
  }
}
