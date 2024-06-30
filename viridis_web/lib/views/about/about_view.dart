import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:viridis_web/views/about/widgets/about_detail_frame.dart';
import 'package:viridis_web/views/about/widgets/about_explore_frame.dart';
import 'package:viridis_web/views/about/widgets/about_frame.dart';
import 'package:viridis_web/views/about/widgets/blogs_frame.dart';
import 'package:viridis_web/views/about/widgets/team_frame.dart';
import 'package:viridis_web/views/home/widgets/contact_frame.dart';
import 'package:viridis_web/views/home/widgets/innovation_frame.dart';
import 'package:viridis_web/views/home/widgets/landing_frame.dart';
import 'package:viridis_web/views/vision/widgets/roadmap_frame.dart';
import 'package:viridis_web/views/home/widgets/tab_frame.dart';
import 'package:viridis_web/views/home/widgets/transparency_frame.dart';
import 'package:viridis_web/widgets/FadeInListWidget.dart';
import 'package:viridis_web/widgets/animated_appbar.dart';
import 'package:viridis_web/widgets/explore_frame.dart';
import 'package:viridis_web/views/vision/widgets/vision_frame.dart';
import 'package:viridis_web/views/vision/widgets/mission_frame.dart';
import 'package:viridis_web/widgets/custom_footer.dart';
import '../../routes/app_pages.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_drawer.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: AssetImage("assets/images/gradients.png"),
            //         fit: BoxFit.cover)),
            child: Stack(
          children: <Widget>[
            ListView(
              controller: _controller,
              children: [
                PreferredSize(
                  preferredSize: Size.fromHeight(80),
                  child: CustomAppBar(
                    page: Routes.ABOUT,
                  ),
                ),
                FadeInListItem(child: AboutFrame()),
                FadeInListItem(child: TeamFrame()),
                FadeInListItem(child: AboutExploreFrame()),
                FadeInListItem(child: AboutDetailFrame()),
                FadeInListItem(child: BlogsFrame()),
                FadeInListItem(child: ExploreFrame()),
                CustomFooter(),
              ],
            ),
            AnimatedAppbar(controller: _controller, route: Routes.ABOUT)
          ],
        )),
        drawer: const CustomDrawer(),
      ),
    );
  }
}
