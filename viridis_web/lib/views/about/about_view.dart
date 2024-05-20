import 'package:flutter/material.dart';
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
import 'package:viridis_web/widgets/explore_frame.dart';
import 'package:viridis_web/views/vision/widgets/vision_frame.dart';
import 'package:viridis_web/views/vision/widgets/mission_frame.dart';
import 'package:viridis_web/widgets/custom_footer.dart';
import '../../routes/app_pages.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_drawer.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                PreferredSize(
                  preferredSize: Size.fromHeight(80),
                  child: CustomAppBar(
                    page: Routes.ABOUT,
                  ),
                ),
                AboutFrame(),
                TeamFrame(),
                AboutExploreFrame(),
                AboutDetailFrame(),
                BlogsFrame(),
                ExploreFrame(),
                CustomFooter(),
              ],
            ),
          ),
        ),
        drawer: CustomDrawer(),
      ),
    );
  }
}
