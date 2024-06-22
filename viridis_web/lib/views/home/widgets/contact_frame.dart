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
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              "images/bg_contact_frame.png",
            ),
            fit: BoxFit.cover),
        color: Colors.black,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      height: 816.h,
      width: 1.sw,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 700),
          child: Column(children: [
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: "Reaching a ",
                      style: GoogleFonts.inter(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                  TextSpan(
                      text: "Climate Positive ",
                      style: GoogleFonts.inter(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff012B3F))),
                  TextSpan(
                      text: "Future Step by Step",
                      style: GoogleFonts.inter(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                ])),
            SizedBox(
              height: 30.h,
            ),
            Text(
                "Track our process from project developer to certification with our partner TUV SUD. Empowering businesses Towards verifiable environmental impact.",
                textAlign: TextAlign.center,
                style: Responsive.getTextStyle(context,
                    dSize: 21,
                    mSize: 18,
                    weight: FontWeight.w500,
                    textColor: Colors.white)),
            SizedBox(
              height: 40.h,
            ),
            CTAButton(
              filled: true,
              child: Text(
                "Contact us",
              ),
              onTap: () => Get.toNamed(Routes.CONTACT),
            )
          ]),
        ),
      ]),
    );
  }
}
