import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:viridis_web/widgets/cta_button.dart';

import '../../../utilities/constants.dart';
import '../../../utilities/responsive.dart';
import '../../../widgets/FadeInListWidget.dart';

class PreparedFrame extends StatefulWidget {
  const PreparedFrame({super.key});

  @override
  State<PreparedFrame> createState() => _PreparedFrameState();
}

class _PreparedFrameState extends State<PreparedFrame> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      constraints: const BoxConstraints(minHeight: 900),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/launch_web.png"),
              fit: BoxFit.cover)),
      child: FadeInListItem(
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
                        )
                      ],
                    ),
                  )),
            ]),
          )),
    );
  }
}
