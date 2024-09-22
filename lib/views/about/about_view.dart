// import 'package:flutter/material.dart';
// import 'package:viridis_web/views/about/widgets/about_detail_frame.dart';
// import 'package:viridis_web/views/about/widgets/about_explore_frame.dart';
// import 'package:viridis_web/views/about/widgets/about_frame.dart';
// import 'package:viridis_web/views/vision/widgets/blogs_frame.dart';
// import 'package:viridis_web/views/about/widgets/team_frame.dart';
// import 'package:viridis_web/widgets/FadeInListWidget.dart';
// import 'package:viridis_web/widgets/animated_appbar.dart';
// import 'package:viridis_web/widgets/explore_frame.dart';
// import 'package:viridis_web/widgets/custom_footer.dart';
// import '../../routes/app_pages.dart';
// import '../../widgets/custom_appbar.dart';
// import '../../widgets/custom_drawer.dart';

// class AboutView extends StatefulWidget {
//   const AboutView({super.key});

//   @override
//   State<AboutView> createState() => _AboutViewState();
// }

// class _AboutViewState extends State<AboutView> {
//   final _controller = ScrollController();

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         body: Container(
//             // decoration: BoxDecoration(
//             //     image: DecorationImage(
//             //         image: AssetImage("assets/images/gradients.png"),
//             //         fit: BoxFit.cover)),
//             child: Stack(
//           children: <Widget>[
//             ListView(
//               controller: _controller,
//               children: const [
//                 PreferredSize(
//                   preferredSize: Size.fromHeight(80),
//                   child: CustomAppBar(
//                     page: Routes.ABOUT,
//                   ),
//                 ),
//                 FadeInListItem(child: AboutFrame()),
//                 FadeInListItem(child: TeamFrame()),
//                 FadeInListItem(child: AboutExploreFrame()),
//                 FadeInListItem(child: AboutDetailFrame()),
//                 // FadeInListItem(child: BlogsFrame()),
//                 FadeInListItem(child: ExploreFrame()),
//                 CustomFooter(),
//               ],
//             ),
//             AnimatedAppbar(controller: _controller, route: Routes.ABOUT)
//           ],
//         )),
//         drawer: const CustomDrawer(),
//       ),
//     );
//   }
// }
