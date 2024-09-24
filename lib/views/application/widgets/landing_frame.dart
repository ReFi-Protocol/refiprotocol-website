import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:viridis_web/widgets/cta_button.dart';

import '../../../utilities/constants.dart';
import '../../../utilities/responsive.dart';
import '../../../widgets/FadeInListWidget.dart';
import '../../../widgets/gradient_text.dart';

class LandingFrame extends StatefulWidget {
  const LandingFrame({super.key, required this.controller});
  final ScrollController controller;

  @override
  State<LandingFrame> createState() => _LandingFrameState();
}

class _LandingFrameState extends State<LandingFrame>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(minHeight: 520),
        // height: Responsive.isMobile(context) ? 650 : 1.22.sh,
        width: 1.sw,
        child: _data());
  }

  _data() {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      FadeInListItem(
          duration: const Duration(milliseconds: 1500),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            constraints: const BoxConstraints(maxWidth: 550),
            child: Column(children: [
              Text(
                "Launching",
                textAlign: TextAlign.center,
                style: Responsive.getTextStyle(context, mSize: 18, dSize: 18),
              ),
              SizedBox(
                height: 15.h,
              ),
              GradientText(
                text: "ReFi Amazon",
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff07BA9A),
                    Colors.white
                  ], // define your gradient colors
                ),
                style: Responsive.getTextStyle(context,
                    weight: FontWeight.w600,
                    dSize: 55,
                    mSize: 35,
                    textColor: Colors.white),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Our Sustainability Dashboard",
                textAlign: TextAlign.center,
                style: Responsive.getTextStyle(context,
                    mSize: 20, textColor: const Color(0xff878787)),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Enhancing the impact of sustainability projects with our dashboard for all things ReFi",
                textAlign: TextAlign.center,
                style: Responsive.getTextStyle(context,
                    mSize: 14,
                    dSize: 16,
                    textColor: const Color(0xff878787),
                    weight: FontWeight.w500),
              ),
              SizedBox(
                height: 60.h,
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 170),
                child: CTAButton(
                    filled: true,
                    onTap: () => launchDashboardURL(),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Launch App",
                        ),
                        Icon(
                          Icons.chevron_right,
                          // color: Colors.white,
                        )
                      ],
                    )),
              ),
            ]),
          )),
    ]);
  }
}
