import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:viridis_web/utilities/constants.dart';
import 'package:viridis_web/widgets/cta_button.dart';

import '../../../utilities/responsive.dart';
import '../../../widgets/FadeInListWidget.dart';

class TransparencyFrame extends StatefulWidget {
  const TransparencyFrame({super.key, required this.controller});
  final ScrollController controller;

  @override
  State<TransparencyFrame> createState() => _TransparencyFrameState();
}

class _TransparencyFrameState extends State<TransparencyFrame> {
  _getContainerPadding() {
    if (Responsive.isDesktop(context)) {
      return const EdgeInsets.all(55);
    } else {
      return const EdgeInsets.all(15);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: _getContainerPadding(),
        constraints: BoxConstraints(minHeight: 500, maxWidth: 1.sw),
        height: 1.1.sh,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(15) // Adjust the radius as needed
              ),
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  child: Responsive.isDesktop(context)
                      ? Image.asset(
                          "images/bg_transparency_frame.png",
                          width: 1.sw,
                          height: 1.1.sh,
                          fit: BoxFit.fill,
                        )
                      : Image.asset(
                          "images/bg_transparency_frame_mobile.png",
                          width: 1.sw,
                          height: 1.1.sh,
                          fit: BoxFit.fill,
                        )),
              Center(child: _parallaxImage())
            ],
          ),
        ));
  }

  _parallaxImage() {
    return AnimatedBuilder(
        animation: widget.controller,
        builder: (context, child) {
          double offsetY = widget.controller.offset > 1.2.sh
              ? (widget.controller.offset - 1.2.sh) *
                  (Responsive.isDesktop(context) ? 0.225 : 0.225)
              : 0;
          return Transform.translate(
            offset: Offset(0, offsetY),
            child: child,
          );
        },
        child: FadeInListItem(duration: Duration(seconds: 1), child: _data()));
  }

  _data() {
    return Column(children: [
      Container(
        width: 1.sw,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 660),
                child: Column(children: [
                  Text(
                    "Moving away from carbon credits",
                    textAlign: TextAlign.center,
                    style: Responsive.getTextStyle(context,
                        mSize: 30, dSize: 40, weight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Eliminating greenwashing concerns through focus on underlying carbon projects rather than carbon credits.",
                    textAlign: TextAlign.center,
                    style: Responsive.getTextStyle(context),
                  ),
                  SizedBox(
                    height: 35.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CTAButton(
                          filled: true,
                          onTap: () => launchMediumURL(),
                          child: const Row(
                            children: [
                              Text(
                                "Explore",
                              ),
                              Icon(
                                Icons.chevron_right,
                              )
                            ],
                          )),
                    ],
                  )
                ]),
              ),
            ]),
      ),
      // SizedBox(
      //   height: 45.h,
      // ),
      // ConstrainedBox(
      //     constraints: const BoxConstraints(maxWidth: 600),
      //     child: _subText()),
    ]);
  }

  _subText() {
    return Column(children: [
      // Text(
      //   "Viridis utilizes network of decentralized VVBs to continuously authenticate carbon, allowing users to trace their lifecycle with immutable records, fostering trust and reliability.",
      //   textAlign: TextAlign.center,
      //   style: Responsive.getTextStyle(context,
      //       mSize: 15, dSize: 18, weight: FontWeight.w400),
      // ),
      // SizedBox(
      //   height: 60.h,
      // ),
      Text(
        "Stay tuned as we navigate this continuous line of positive environmental impact, one breakthrough at a time!",
        textAlign: TextAlign.center,
        style: Responsive.getTextStyle(context,
            mSize: 14, dSize: 14, weight: FontWeight.w400),
      ),
      SizedBox(
        height: 10.h,
      ),
      Text(
        "Our sustainability journey is hitting new milestones!",
        textAlign: TextAlign.center,
        style: Responsive.getTextStyle(context,
            mSize: 14, dSize: 14, weight: FontWeight.w400),
      ),
    ]);
  }

  // _ctaButton({Widget? child, bool filled = false, Function()? onTap}) {
  //   return OutlinedButton(
  //     onPressed: onTap,
  //     style: ButtonStyle(
  //       padding: const MaterialStatePropertyAll(
  //           EdgeInsets.symmetric(horizontal: 25, vertical: 18)),
  //       overlayColor: MaterialStatePropertyAll(Colors.green.withOpacity(0.1)),
  //       side: const MaterialStatePropertyAll(BorderSide(color: Colors.white)),
  //       backgroundColor:
  //           filled ? const MaterialStatePropertyAll(Colors.white) : null,
  //     ),
  //     child: child,
  //   );
  // }

  _learnMore() {
    return TextButton(
        onPressed: () {},
        style: ButtonStyle(
            overlayColor:
                MaterialStatePropertyAll(Colors.green.withOpacity(0.01))),
        child: Row(
          children: [
            Text(
              "Learn More",
              style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            const Icon(
              Icons.chevron_right,
              color: Colors.white,
            )
          ],
        ));
  }
}
