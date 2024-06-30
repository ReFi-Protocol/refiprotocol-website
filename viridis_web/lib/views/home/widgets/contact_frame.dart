import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viridis_web/utilities/responsive.dart';
import 'package:viridis_web/widgets/cta_button.dart';

import '../../../routes/app_pages.dart';

class ContactFrame extends StatefulWidget {
  const ContactFrame({super.key});

  @override
  State<ContactFrame> createState() => _ContactFrameState();
}

class _ContactFrameState extends State<ContactFrame> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              "images/bg_contact_frame.png",
            ),
            fit: BoxFit.cover),
        color: Colors.black,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: 816,
      width: 1.sw,
      child: Stack(children: [
        Align(
          alignment: Alignment.topRight,
          child: Image.asset(
            "images/tuv_sud.png",
            width: Responsive.isDesktop(context) ? 100 : 70,
            height: Responsive.isDesktop(context) ? 100 : 70,
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 40),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 700),
                  child: Column(children: [
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: "Reaching a ",
                              style: GoogleFonts.inter(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black)),
                          TextSpan(
                              text: "Climate Positive ",
                              style: GoogleFonts.inter(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff012B3F))),
                          TextSpan(
                              text: "Future Step by Step",
                              style: GoogleFonts.inter(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black)),
                        ])),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                        "We work with real-world companies like TÜV SÜD to support project developers and tokenize their projects, empowering businesses towards verifiable environmental impact. By collaborating with trusted partners, we ensure that our initiatives are both credible and impactful.",
                        textAlign: TextAlign.center,
                        style: Responsive.getTextStyle(context,
                            dSize: 18,
                            mSize: 18,
                            weight: FontWeight.w500,
                            textColor: Colors.black)),
                    SizedBox(
                      height: 40.h,
                    ),
                    CTAButton(
                      filled: true,
                      child: const Text(
                        "Contact us",
                      ),
                      onTap: () => Get.toNamed(Routes.CONTACT),
                    )
                  ]),
                ),
              ])),
        )
      ]),
    );
  }
}
