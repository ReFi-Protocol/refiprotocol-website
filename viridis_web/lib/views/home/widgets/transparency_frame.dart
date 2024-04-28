import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TransparencyFrame extends StatefulWidget {
  const TransparencyFrame({super.key});

  @override
  State<TransparencyFrame> createState() => _TransparencyFrameState();
}

class _TransparencyFrameState extends State<TransparencyFrame> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      height: 927.h,
      width: 1.sw,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: Column(children: [
            Text(
              "Bringing Transparency to the Carbon Market",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Seamlessly, eliminating greenwashing concerns through robust data infrastructure",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            SizedBox(
              height: 35.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ctaButton(
                    filled: true,
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
                SizedBox(
                  width: 40.w,
                ),
                _learnMore()
              ],
            )
          ]),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: Column(children: [
            Text(
              "Viridis utilizes network of decentralized VVBs to continuously authenticate carbon, allowing users to trace their lifecycle with immutable records, fostering trust and reliability.",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            SizedBox(
              height: 60.h,
            ),
            Text(
              "Stay tuned as we navigate this continuous line of positive environmental impact, one breakthrough at a time!",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Our sustainability journey is hitting new milestones!",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
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
