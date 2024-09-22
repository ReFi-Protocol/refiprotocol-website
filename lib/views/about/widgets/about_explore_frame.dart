// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:viridis_web/widgets/cta_button.dart';

// import '../../../utilities/constants.dart';
// import '../../../utilities/responsive.dart';

// class AboutExploreFrame extends StatefulWidget {
//   const AboutExploreFrame({super.key});

//   @override
//   State<AboutExploreFrame> createState() => _AboutExploreFrameState();
// }

// class _AboutExploreFrameState extends State<AboutExploreFrame> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 1.sh,
//       child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//         Container(
//           constraints: const BoxConstraints(maxWidth: 900),
//           padding: const EdgeInsets.all(30),
//           child: Column(children: [
//             Text(
//               "ReFi Protocol Embarks on a Mission to Integrate DeFi and the Voluntary Carbon Market (VCM).",
//               textAlign: TextAlign.center,
//               style: Responsive.getTextStyle(context,
//                   weight: FontWeight.w500, mSize: 25, dSize: 40),
//             ),
//             SizedBox(
//               height: 30.h,
//             ),
//             Text(
//               "Empowering participants in the Regenerative Finance (ReFi) economy, Viridis offers a decentralized, user-friendly Web3 infrastructure. Here, ReFi signifies a commitment to the environment and climate, advocating for the integration of carbon costs into the realm of DeFi. ",
//               textAlign: TextAlign.center,
//               style: Responsive.getTextStyle(context,
//                   weight: FontWeight.w400, mSize: 16, dSize: 18),
//             ),
//             SizedBox(
//               height: 50.h,
//             ),
//             CTAButton(
//               onTap: () => launchDocsURL(),
//               filled: true,
//               child: const Text("Find Out More"),
//             ),
//           ]),
//         ),
//         SizedBox(
//           height: 50.h,
//         ),
//         Expanded(
//             child: Image.asset(
//           "assets/images/about_explore.jpeg",
//         ))
//       ]),
//     );
//   }
// }
