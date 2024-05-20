import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utilities/responsive.dart';

class TransparencyFrame extends StatefulWidget {
  const TransparencyFrame({super.key});

  @override
  State<TransparencyFrame> createState() => _TransparencyFrameState();
}

class _TransparencyFrameState extends State<TransparencyFrame> {
  _getContainerPadding() {
    if (Responsive.isDesktop(context)) {
      return const EdgeInsets.all(45);
    } else {
      return const EdgeInsets.all(15);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _getContainerPadding(),
      color: Colors.black,
      child: Column(children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "images/bg_transparency_frame.png",
                  ),
                  fit: BoxFit.cover),
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          height: 1.sh,
          width: 1.sw,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Column(children: [
                    Text(
                      "Bringing Transparency to the Carbon Market",
                      textAlign: TextAlign.center,
                      style: Responsive.getTextStyle(context,
                          mSize: 30, dSize: 40, weight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Seamlessly, eliminating greenwashing concerns through robust data infrastructure",
                      textAlign: TextAlign.center,
                      style: Responsive.getTextStyle(context),
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _ctaButton(
                            filled: true,
                            onTap: () async {
                              Uri url = Uri.parse(
                                  'https://docs.viridis.network/overview/carbon-credit-architecture');
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Row(
                              children: [
                                Text(
                                  "Explore",
                                  style: GoogleFonts.inter(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                const Icon(
                                  Icons.chevron_right,
                                  color: Colors.black,
                                )
                              ],
                            )),
                        // SizedBox(
                        //   width: 40.w,
                        // ),
                        // _learnMore()
                      ],
                    )
                  ]),
                ),
              ]),
        ),
        SizedBox(
          height: 45.h,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(children: [
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
          ]),
        )
      ]),
    );
  }

  _ctaButton({Widget? child, bool filled = false, Function()? onTap}) {
    return OutlinedButton(
      onPressed: onTap,
      style: ButtonStyle(
        padding: const MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 25, vertical: 18)),
        overlayColor: MaterialStatePropertyAll(Colors.green.withOpacity(0.1)),
        side: const MaterialStatePropertyAll(BorderSide(color: Colors.white)),
        backgroundColor:
            filled ? const MaterialStatePropertyAll(Colors.white) : null,
      ),
      child: child,
    );
  }

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
