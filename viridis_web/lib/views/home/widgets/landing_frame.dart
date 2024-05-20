import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utilities/responsive.dart';

class LandingFrame extends StatefulWidget {
  const LandingFrame({super.key});

  @override
  State<LandingFrame> createState() => _LandingFrameState();
}

class _LandingFrameState extends State<LandingFrame> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 620),
          child: Column(children: [
            Text(
              "Making 'Carbon Neutral' a Reality",
              textAlign: TextAlign.center,
              style: Responsive.getTextStyle(context,
                  mSize: 35, dSize: 50, weight: FontWeight.w900),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Seemlessly integrating Real World Assets (RWA) to support Regenerative Finance (ReFi)",
              textAlign: TextAlign.center,
              style: Responsive.getTextStyle(context),
            ),
            SizedBox(
              height: 60.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ctaButton(
                    onTap: () async {
                      Uri url = Uri.parse(
                          'https://docs.viridis.network/roadmap/roadmap');
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
}
