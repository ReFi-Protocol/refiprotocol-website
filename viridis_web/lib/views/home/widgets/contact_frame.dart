import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

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
                      text: "Building a ",
                      style: GoogleFonts.inter(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                  TextSpan(
                      text: "Carbon Neutral ",
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
              height: 20.h,
            ),
            Text(
              "Track our process from project developer to certification with our partner TUV SUD. Empowering businesses Towards verifiable environmental impact.",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff012B3F)),
            ),
            SizedBox(
              height: 40.h,
            ),
            _ctaButton(
              filled: true,
              child: Text(
                "Contact us",
                style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            )
          ]),
        ),
      ]),
    );
  }

  _ctaButton({Widget? child, bool filled = false}) {
    return OutlinedButton(
      onPressed: () {
        debugPrint('Received click');
      },
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
}
