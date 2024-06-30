import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
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
  // late AnimationController _controller;
  // late Animation<double> _animation;

  // double maxHeight = 0;
  late VideoPlayerController _controller;
  late VideoPlayerController _controller_mobile;
  bool _commet = false;

  @override
  void initState() {
    // maxHeight = (1.sh) > 500 ? 1.sh : 500;
    super.initState();
    _controller = VideoPlayerController.asset("assets/images/hero_section.mov")
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();
          // _startPauseTimer();

          _controller.setLooping(true);
          _controller.setPlaybackSpeed(0.75);
        });
      });

    _controller_mobile =
        VideoPlayerController.asset("assets/images/hero_section_mobile.mov")
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {
              _controller.play();
              // _startPauseTimer();

              _controller.setLooping(true);
              // _controller.setPlaybackSpeed();
            });
          });
    Future.delayed(Duration(seconds: 3), () {
      _toggleImage();
    });
  }

  void _toggleImage() {
    setState(() {
      _commet = !_commet;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
                image: AssetImage("assets/images/hero_bg.png"))),
        constraints: const BoxConstraints(minHeight: 520),
        height: Responsive.isDesktop(context) ? 1.25.sh : 800,
        width: 1.sw,
        child: Stack(
          children: [
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
        mobile: ClipPath(
          child: Container(
              // color: Colors.red,
              child: _controller_mobile.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller_mobile.value.aspectRatio,
                      child: VideoPlayer(_controller_mobile),
                    )
                  : Container()),
        ),
        desktop: ClipPath(
          clipper: CurvedClipper(),
          child: Container(
              // color: Colors.red,
              // constraints: BoxConstraints(maxHeight: 400),
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Image.asset("assets/images/hero_section.png")),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _controller_mobile.dispose();
  }

  // _parallaxImage() {
  //   return AnimatedBuilder(
  //       animation: widget.controller,
  //       builder: (context, child) {
  //         double offsetY = widget.controller.offset *
  //             (Responsive.isDesktop(context) ? 0.3 : 0.15);
  //         return Transform.translate(
  //           offset: Offset(0, offsetY),
  //           child: child,
  //         );
  //       },
  //       child: FadeInListItem(child: _data()));
  // }

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
              duration: Duration(seconds: 1),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
                constraints: const BoxConstraints(maxWidth: 850),
                child: Column(children: [
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "First Tokenization Framework For ",
                            style: Responsive.getTextStyle(context,
                                mSize: 35, dSize: 50, weight: FontWeight.w900)),
                        TextSpan(
                            text: "all",
                            style: Responsive.getTextStyle(context,
                                mSize: 35,
                                dSize: 50,
                                weight: FontWeight.w900,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white)),
                        TextSpan(
                            text: " Carbon Projects",
                            style: Responsive.getTextStyle(context,
                                mSize: 35, dSize: 50, weight: FontWeight.w900)),
                      ])),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Seamlessly deploying anything from forests to windfarms as RWAs to support ReFi",
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
            alignment: !_commet ? Alignment.topRight : Alignment.centerLeft,
            duration: Duration(seconds: 1),
            child: AnimatedSwitcher(
              duration: Duration(seconds: 2),
              switchInCurve: Curves.decelerate,
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: !_commet
                  ? SvgPicture.asset(
                      'assets/images/initial_star.svg',
                      key: ValueKey(1),
                    )
                  : SvgPicture.asset(
                      'assets/images/final_star.svg',
                      key: ValueKey(2),
                    ),
            ));
  }
}
