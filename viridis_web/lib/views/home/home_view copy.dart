// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:viridis_web/views/home/widgets/contact_frame.dart';
// import 'package:viridis_web/views/home/widgets/innovation_frame.dart';
// import 'package:viridis_web/views/home/widgets/landing_frame.dart';
// import 'package:viridis_web/views/home/widgets/tab_frame.dart';
// import 'package:viridis_web/views/home/widgets/transparency_frame.dart';
// import 'package:viridis_web/widgets/custom_drawer.dart';
// import 'package:viridis_web/widgets/custom_footer.dart';
// import '../../routes/app_pages.dart';
// import '../../utilities/constants.dart';
// import '../../utilities/responsive.dart';
// import '../../widgets/FadeInListWidget.dart';
// import '../../widgets/animated_appbar.dart';
// import '../../widgets/custom_appbar.dart';

// class HomeView extends StatefulWidget {
//   const HomeView({super.key});

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Animate between SVGs')),
//       body: SvgImageSwitcher(),
//     );
//   }
// }

// class SvgImageSwitcher extends StatefulWidget {
//   @override
//   _SvgImageSwitcherState createState() => _SvgImageSwitcherState();
// }

// class _SvgImageSwitcherState extends State<SvgImageSwitcher> {
//   bool _firstImageVisible = true;

//   void _toggleImage() {
//     setState(() {
//       _firstImageVisible = !_firstImageVisible;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         AnimatedContainer(
//             height: 500,
//             width: 500,
//             alignment:
//                 _firstImageVisible ? Alignment.topRight : Alignment.bottomLeft,
//             duration: Duration(seconds: 1),
//             child: AnimatedSwitcher(
//               duration: Duration(seconds: 1),
//               transitionBuilder: (Widget child, Animation<double> animation) {
//                 return FadeTransition(opacity: animation, child: child);
//               },
//               child: _firstImageVisible
//                   ? SvgPicture.asset(
//                       'assets/images/initial_star.svg',
//                       key: ValueKey(1),
//                     )
//                   : SvgPicture.asset(
//                       'assets/images/final_star.svg',
//                       key: ValueKey(2),
//                     ),
//             )),
//         SizedBox(height: 20),
//         ElevatedButton(
//           onPressed: _toggleImage,
//           child: Text('Toggle Image'),
//         ),
//       ],
//     );
//   }
// }
