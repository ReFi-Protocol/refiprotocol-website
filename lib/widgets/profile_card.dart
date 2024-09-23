// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../utilities/responsive.dart';

// class ProfileCard extends StatefulWidget {
//   const ProfileCard(
//       {super.key, required this.title, required this.name, required this.path});
//   final String title;
//   final String name;
//   final String path;

//   @override
//   State<ProfileCard> createState() => _ProfileCardState();
// }

// class _ProfileCardState extends State<ProfileCard>
//     with TickerProviderStateMixin {
//   bool _hover = false;
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 100),
//       vsync: this,
//     );

//     _animation = Tween<double>(begin: 1, end: 0).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.slowMiddle,
//     ))
//       ..addListener(() {
//         setState(() {});
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (event) => setState(() {
//         _hover = true;
//         _controller.forward();
//       }),
//       onExit: (event) => setState(() {
//         _hover = false;
//         _controller.reverse();
//       }),
//       child: Container(
//         width: 340.w,
//         height: 430,
//         decoration: BoxDecoration(
//             color: Colors.black,
//             image: DecorationImage(
//                 image: AssetImage(widget.path), fit: BoxFit.fill)),
//         alignment: Alignment.bottomCenter,
//         child: Responsive.isMobile(context) ? info() : animatedInfo(),
//       ),
//     );
//   }

//   animatedInfo() {
//     return Transform.translate(
//         offset: Offset(0, _animation.value * 20),
//         child: Opacity(opacity: (1 - _animation.value), child: info()));
//   }

//   info() {
//     return Container(
//       child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Expanded(
//               child: ClipRRect(
//                 child: BackdropFilter(
//                   filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(vertical: 8),
//                     constraints: BoxConstraints(
//                         maxHeight: Responsive.isDesktop(context) ? 95.h : 80.h),
//                     decoration:
//                         BoxDecoration(color: Colors.black.withOpacity(0.28)),
//                     child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             widget.title,
//                             textAlign: TextAlign.center,
//                             style: Responsive.getTextStyle(context,
//                                 weight: FontWeight.w300, mSize: 14, dSize: 16),
//                           ),
//                           Text(
//                             widget.name,
//                             textAlign: TextAlign.center,
//                             style: Responsive.getTextStyle(context,
//                                 weight: FontWeight.w500, mSize: 20, dSize: 25),
//                           )
//                         ]),
//                   ),
//                 ),
//               ),
//             )
//             // BackdropFilter(
//             //     filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
//             //     child: Container(
//             //         // width: double.infinity,
//             //         decoration: BoxDecoration(
//             //             color: Color(0xff000000).withOpacity(0.78)),
//             //         child: Text(
//             //           title,
//             //           textAlign: TextAlign.center,
//             //           style: GoogleFonts.inter(
//             //               fontSize: 30,
//             //               fontWeight: FontWeight.w600,
//             //               color: Colors.white),
//             //         )))
//           ]),
//     );
//   }
// }
