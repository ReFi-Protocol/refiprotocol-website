import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingFrame extends StatefulWidget {
  const LandingFrame({super.key});

  @override
  State<LandingFrame> createState() => _LandingFrameState();
}

class _LandingFrameState extends State<LandingFrame> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      height: 832.h,
      width: 1.sw,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: Column(children: [
            Text(
              "Making carbon neutral a reality for DeFi",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 50,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Seamlessly integrating DeFI with the Voluntary Carbon Market",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            SizedBox(
              height: 60.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ctaButton(
                    child: Row(
                  children: [
                    Text(
                      "Explore",
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    const Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    )
                  ],
                )),
                SizedBox(
                  width: 40.w,
                ),
                _ctaButton(
                    filled: true,
                    child: Text(
                      "Contact us",
                      style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ))
              ],
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
