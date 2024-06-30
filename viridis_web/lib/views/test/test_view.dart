// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:video_player/video_player.dart';
// import 'package:viridis_web/widgets/innovation_container.dart';
// import 'package:chewie/chewie.dart';
// import '../../routes/app_pages.dart';
// import '../../utilities/responsive.dart';
// import '../../widgets/cta_button.dart';
// import '../../widgets/custom_appbar.dart';

// // Image.asset(
// //               "assets/images/bg_landing_frame.png",
// //               width: 1.sw,
// //               fit: BoxFit.cover,
// //             )

// class TestScreen extends StatefulWidget {
//   const TestScreen({super.key});

//   @override
//   State<TestScreen> createState() => _TestScreenState();
// }

// class _TestScreenState extends State<TestScreen> {
//   late VideoPlayerController _controller;

//   late ChewieController _chewieController;

//   // late AnimationController _controller;
//   // late Animation<double> _animation;

//   // double maxHeight = 0;

//   @override
//   void initState() {
//     // maxHeight = (1.sh) > 500 ? 1.sh : 500;
//     super.initState();
//     _controller = VideoPlayerController.asset("assets/videos/hero_section.mov")
//       ..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         setState(() {
//           _controller.play();
//           _controller.setLooping(true);
//           _controller.setPlaybackSpeed(0.5);
//         });
//       });

//     _chewieController = new ChewieController(
//         videoPlayerController: _controller,
//         autoPlay: true,
//         showControls: false,
//         showOptions: false);

//     // _controller = AnimationController(
//     //   duration: const Duration(minutes: 1),
//     //   vsync: this,
//     // )..repeat(reverse: false);
//     // _animation = Tween<double>(begin: 1.0, end: 1.3).animate(CurvedAnimation(
//     //   parent: _controller,
//     //   curve: Curves.fastEaseInToSlowEaseOut,
//     // ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//           decoration: BoxDecoration(
//               color: Colors.black,
//               image: DecorationImage(
//                   alignment: Alignment.topCenter,
//                   image: AssetImage("assets/images/hero_bg.png"))),
//           constraints: const BoxConstraints(minHeight: 520),
//           height: 1.2.sh,
//           width: 1.sw,
//           child: Stack(
//             children: [
//               Center(
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 20, vertical: 60),
//                         constraints: const BoxConstraints(maxWidth: 650),
//                         child: Column(children: [
//                           Text(
//                             "Making 'Carbon Neutral' a Reality",
//                             textAlign: TextAlign.center,
//                             style: Responsive.getTextStyle(context,
//                                 mSize: 35, dSize: 50, weight: FontWeight.w900),
//                           ),
//                           SizedBox(
//                             height: 20.h,
//                           ),
//                           Text(
//                             "Seamlessly integrating Real World Assets (RWA) to support Regenerative Finance (ReFi)",
//                             textAlign: TextAlign.center,
//                             style: Responsive.getTextStyle(context),
//                           ),
//                           SizedBox(
//                             height: 60.h,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               CTAButton(
//                                   filled: false,
//                                   onTap: () => Get.toNamed(Routes.VISION),
//                                   child: const Row(
//                                     children: [
//                                       Text(
//                                         "Explore",
//                                       ),
//                                       Icon(
//                                         Icons.chevron_right,
//                                         // color: Colors.white,
//                                       )
//                                     ],
//                                   )),
//                               SizedBox(
//                                 width: 40.w,
//                               ),
//                               CTAButton(
//                                   filled: true,
//                                   onTap: () => Get.toNamed(Routes.CONTACT),
//                                   child: const Text(
//                                     "Contact us",
//                                   ))
//                             ],
//                           )
//                         ]),
//                       ),
//                     ]),
//               ),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: _controller.value.isInitialized
//                     ? Container(
//                         color: Colors.red,
//                         child: AspectRatio(
//                           aspectRatio: _controller.value.aspectRatio,
//                           child: Chewie(
//                             controller: _chewieController,
//                           ),
//                         ),
//                       )
//                     : Container(),
//               )
//             ],
//           )),
//     );
//   }
// }
