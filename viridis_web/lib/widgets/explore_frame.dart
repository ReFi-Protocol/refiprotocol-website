import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utilities/responsive.dart';

class ExploreFrame extends StatefulWidget {
  const ExploreFrame({super.key});

  @override
  State<ExploreFrame> createState() => _ExploreFrameState();
}

class _ExploreFrameState extends State<ExploreFrame> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 700),
          child: Column(children: [
            Text(
              "The era of carbon markets has arrived – are you prepared?",
              textAlign: TextAlign.center,
              style: Responsive.getTextStyle(context,
                  weight: FontWeight.w500, mSize: 25, dSize: 40),
            ),
            SizedBox(
              height: 50.h,
            ),
            _ctaButton(
              filled: true,
              child: Text(
                "Let's Explore",
                style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
          ]),
        ),
        SizedBox(
          height: 50.h,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            "images/wave_line.png",
          ),
        )
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
