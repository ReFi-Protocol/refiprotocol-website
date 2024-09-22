// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../../../utilities/responsive.dart';
// import '../../../widgets/dotted_circle.dart';

// class RoadmapWidget extends StatefulWidget {
//   const RoadmapWidget({super.key, required this.controller});
//   final ScrollController controller;

//   @override
//   State<RoadmapWidget> createState() => _RoadmapWidgetState();
// }

// class _RoadmapWidgetState extends State<RoadmapWidget>
//     with TickerProviderStateMixin {
//   final List<GlobalKey> containerKeys = [
//     GlobalKey(),
//     GlobalKey(),
//     GlobalKey(),
//     GlobalKey()
//   ];
//   List<AnimationController> boxControllers = [];
//   List<Animation> boxAnimations = [];
//   List<bool> boxActivates = List.filled(4, false);

//   @override
//   void initState() {
//     for (int i = 0; i < 4; i++) {
//       boxControllers.add(AnimationController(
//         duration: const Duration(milliseconds: 100),
//         vsync: this,
//       ));
//       boxAnimations.add(Tween(begin: 0, end: 1.0).animate(CurvedAnimation(
//           parent: boxControllers[i], curve: Curves.slowMiddle)));
//     }
//     super.initState();

//     widget.controller.addListener(scrollListener);
//   }

//   @override
//   void dispose() {
//     for (int i = 0; i < 4; i++) {
//       boxControllers[i].dispose();
//     }
//     super.dispose();
//   }

//   double getScrollExtent() {
//     return widget.controller.offset > 1400
//         ? ((widget.controller.offset - 1400) / 800)
//         : 0;
//   }

//   _getContainerHeight() {
//     return Responsive.isDesktop(context) ? 900 : 1000;
//   }

//   double _getItemHeight(GlobalKey key) {
//     final RenderBox? renderBox =
//         key.currentContext?.findRenderObject() as RenderBox?;
//     return (renderBox?.size.height ?? 140);
//   }

//   scrollListener() {
//     if (getScrollExtent() >= 1) {
//       boxActivates[3] = true;
//       boxActivates[2] = true;
//       boxActivates[1] = true;
//       boxActivates[0] = true;
//       boxControllers[3].forward();
//     } else if (getScrollExtent() >= 0.70) {
//       if (boxActivates[3]) {
//         boxActivates[3] = false;
//         boxControllers[3].reverse();
//       }
//       boxActivates[2] = true;
//       boxActivates[1] = true;
//       boxActivates[0] = true;
//       boxControllers[2].forward();
//     } else if (getScrollExtent() >= 0.35) {
//       if (boxActivates[2]) {
//         boxActivates[2] = false;
//         boxControllers[2].reverse();
//       }
//       boxActivates[1] = true;
//       boxActivates[0] = true;
//       boxControllers[1].forward();
//     } else if (getScrollExtent() > 0) {
//       if (boxActivates[1]) {
//         boxActivates[1] = false;
//         boxControllers[1].reverse();
//       }
//       boxActivates[0] = true;
//       boxControllers[0].forward();
//     } else {
//       if (boxActivates[0]) {
//         boxActivates[0] = false;
//         boxControllers[0].reverse();
//       }
//       boxActivates = List.filled(4, false);
//     }

//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: _getContainerHeight(),
//       child: Stack(
//         children: [
//           Align(alignment: Alignment.topLeft, child: _progressBar()),
//           Align(
//               alignment: Alignment.topLeft,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   _roadmapDetail(
//                       "Viridis Network Launch",
//                       [
//                         "ERC20 Token Release",
//                         "Creation of V1 Whitepaper and Documentation",
//                         "Viridis Network at COP28",
//                       ],
//                       key: containerKeys[0],
//                       controller: boxControllers[0],
//                       loaded: boxActivates[0]),
//                   _roadmapDetail(
//                       "Development of L1 Blockchain Platform",
//                       [
//                         "Architecture Formulation of Wrapped Carbon (wCRBN) NFTs",
//                         "Viridis EVM Testnet Staking and Airdrop",
//                         "Partnership with Validation/Verification Body (VVB)"
//                             "Viridis L2 Testnet",
//                       ],
//                       key: containerKeys[1],
//                       controller: boxControllers[1],
//                       loaded: boxActivates[1]),
//                   _roadmapDetail(
//                     "Viridis Network L1 Blockchain Launch",
//                     [
//                       "Mainnet Explorer, Bridging and Staking Platform",
//                       "Carbon Ambassador Program",
//                       "wCRBN Issuance",
//                     ],
//                     key: containerKeys[2],
//                     controller: boxControllers[2],
//                     loaded: boxActivates[2],
//                     inProgress: true,
//                     completed: false,
//                   ),
//                   _roadmapDetail(
//                     "DApp and NFT Marketplace",
//                     [
//                       "Unified VRD DApp",
//                       "Rebrand",
//                       "Decentralization of Validation/Verification Bodies (VVBs)",
//                       "Onboarding of Derivative Products",
//                     ],
//                     key: containerKeys[3],
//                     loaded: boxActivates[3],
//                     controller: boxControllers[3],
//                     textColor: const Color(0xff444141),
//                     completed: false,
//                   ),
//                 ],
//               )),
//         ],
//       ),
//     );
//   }

//   _progressBar() {
//     double maxFill = 0.7;
//     return AnimatedBuilder(
//         animation: widget.controller,
//         builder: (context, child) {
//           double barHeight =
//               _getContainerHeight() - _getItemHeight(containerKeys.last);
//           double scrollExtent = getScrollExtent();
//           double filledHeight = min(scrollExtent, maxFill) * barHeight;

//           return Container(
//             margin: const EdgeInsets.only(
//               left: 20,
//             ),
//             height: barHeight,
//             width: 2,
//             child: Stack(children: [
//               Container(color: const Color(0xff393A3A)),
//               Container(height: filledHeight, color: const Color(0xff07BA9B)),
//             ]),
//           );
//         });
//   }

//   _roadmapDetail(String title, List<String> details,
//       {Key? key,
//       required AnimationController controller,
//       bool completed = true,
//       bool loaded = false,
//       bool inProgress = false,
//       Color textColor = Colors.white}) {
//     return Container(
//       key: key,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Builder(builder: (context) {
//             if (completed) {
//               return CircleAvatar(
//                 backgroundColor:
//                     loaded ? const Color(0xff07BA9B) : const Color(0xff393A3A),
//                 child: loaded
//                     ? const Icon(
//                         Icons.check,
//                         size: 35,
//                         color: Colors.black,
//                       )
//                     : null,
//               );
//             } else if (inProgress) {
//               return CircleAvatar(
//                   backgroundColor: Colors.black,
//                   child: DottedCircle(
//                     color: loaded
//                         ? const Color(0xff07BA9B)
//                         : const Color(0xff393A3A),
//                     radius: 20,
//                     strokeWidth: 3,
//                     gap: 10,
//                   ));
//             }
//             return const CircleAvatar(backgroundColor: Color(0xff393A3A));
//           }),
//           const SizedBox(
//             width: 50,
//           ),
//           Expanded(
//             child: FadeTransition(
//                 opacity: controller,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       style: Responsive.getTextStyle(context,
//                           mSize: 20,
//                           dSize: 25,
//                           weight: FontWeight.w600,
//                           textColor: textColor),
//                     ),
//                     SizedBox(
//                       height: 20.h,
//                     ),
//                     for (String detail in details)
//                       Padding(
//                         padding: EdgeInsets.only(bottom: 10.h),
//                         child: Text(
//                           detail,
//                           style: GoogleFonts.inter(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w400,
//                               color: textColor),
//                         ),
//                       )
//                   ],
//                 )),
//           ),
//         ],
//       ),
//     );
//   }
// }
