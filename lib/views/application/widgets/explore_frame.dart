import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:viridis_web/widgets/cta_button.dart';

import '../../../utilities/constants.dart';
import '../../../utilities/responsive.dart';
import '../../../widgets/FadeInListWidget.dart';

class ExploreFrame extends StatefulWidget {
  const ExploreFrame({super.key});

  @override
  State<ExploreFrame> createState() => _ExploreFrameState();
}

class _ExploreFrameState extends State<ExploreFrame> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        FadeInListItem(
            duration: const Duration(seconds: 1),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 740),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "The era of climate driven RWAs + DeFi has arrived - are you prepared",
                    textAlign: TextAlign.center,
                    style: Responsive.getTextStyle(context,
                        weight: FontWeight.w500, mSize: 25, dSize: 40),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 170),
                    child: CTAButton(
                      filled: true,
                      onTap: () => launchDashboardURL(),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Launch App",
                          ),
                          Icon(
                            Icons.chevron_right,
                            // color: Colors.white,
                          )
                        ],
                      ),
                    )),
              ]),
            )),
        SizedBox(
          height: 50.h,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            "assets/images/wave_line.png",
          ),
        )
      ]),
    );
  }

  // _ctaButton({Widget? child, bool filled = false}) {
  //   return OutlinedButton(
  //     onPressed: () {
  //       debugPrint('Received click');
  //     },
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
}
