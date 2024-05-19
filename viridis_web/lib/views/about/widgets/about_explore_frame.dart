import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utilities/responsive.dart';

class AboutExploreFrame extends StatefulWidget {
  const AboutExploreFrame({super.key});

  @override
  State<AboutExploreFrame> createState() => _AboutExploreFrameState();
}

class _AboutExploreFrameState extends State<AboutExploreFrame> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          constraints: BoxConstraints(maxWidth: 900),
          padding: EdgeInsets.all(30),
          child: Column(children: [
            Text(
              "Viridis Embarks on a Mission to Integrate DeFi and the Voluntary Carbon Market (VCM).",
              textAlign: TextAlign.center,
              style: Responsive.getTextStyle(context,
                  weight: FontWeight.w500, mSize: 25, dSize: 40),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              "Empowering participants in the Regenerative Finance (ReFi) economy, Viridis offers a decentralized, user-friendly Web3 infrastructure. Here, ReFi signifies a commitment to the environment and climate, advocating for the integration of carbon costs into the realm of DeFi. ",
              textAlign: TextAlign.center,
              style: Responsive.getTextStyle(context,
                  weight: FontWeight.w400, mSize: 16, dSize: 18),
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
        Expanded(
            child: Image.asset(
          "images/about_explore.jpeg",
        ))
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
