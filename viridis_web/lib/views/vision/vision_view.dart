import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:viridis_web/views/home/widgets/contact_frame.dart';
import 'package:viridis_web/views/home/widgets/innovation_frame.dart';
import 'package:viridis_web/views/home/widgets/landing_frame.dart';
import 'package:viridis_web/views/vision/widgets/roadmap_frame.dart';
import 'package:viridis_web/views/home/widgets/tab_frame.dart';
import 'package:viridis_web/views/home/widgets/transparency_frame.dart';
import 'package:viridis_web/widgets/animated_appbar.dart';
import 'package:viridis_web/widgets/explore_frame.dart';
import 'package:viridis_web/views/vision/widgets/vision_frame.dart';
import 'package:viridis_web/views/vision/widgets/mission_frame.dart';
import 'package:viridis_web/widgets/custom_footer.dart';
import '../../routes/app_pages.dart';
import '../../utilities/responsive.dart';
import '../../widgets/FadeInListWidget.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_drawer.dart';

class VisionView extends StatefulWidget {
  VisionView({super.key, this.roadmap = false});
  bool roadmap;

  @override
  State<VisionView> createState() => _VisionViewState();
}

class _VisionViewState extends State<VisionView> {
  List<Widget> widgetList = [];
  // final ItemScrollController _itemScrollController = ItemScrollController();
  final _controller = ScrollController();

  // _scrollToIndex(int index) {
  //   _itemScrollController.scrollTo(
  //       index: index,
  //       duration: const Duration(seconds: 2),
  //       curve: Curves.easeInOutCubic);
  // }

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   if (widget.roadmap) {
    //     _scrollToIndex(3);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            ListView(
              controller: _controller,
              children: [
                const PreferredSize(
                  preferredSize: Size.fromHeight(80),
                  child: CustomAppBar(
                    page: Routes.VISION,
                  ),
                ),
                VisionFrame(
                  controller: _controller,
                ),
                MissionFrame(
                  controller: _controller,
                ),
                FadeInListItem(
                    child: RoadmapFrame(
                  controller: _controller,
                )),
                FadeInListItem(child: const ExploreFrame()),
                const CustomFooter(),
              ],
            ),
            AnimatedAppbar(
              controller: _controller,
              route: Routes.VISION,
            )
          ],
        ),

        // ScrollablePositionedList.builder(

        //   itemCount: widgetList.length,
        //   itemScrollController: _itemScrollController,
        //   itemBuilder: (context, index) {
        //     return widgetList[index];
        //   },
        // ),

        drawer: const CustomDrawer(),
      ),
    );
  }
}
