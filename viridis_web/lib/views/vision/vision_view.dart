import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
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

class VisionView extends StatefulWidget {
  VisionView({super.key, this.roadmap = false});
  bool roadmap;

  @override
  State<VisionView> createState() => _VisionViewState();
}

class _VisionViewState extends State<VisionView> {
  List<Widget> widgetList = [];
  final ItemScrollController _itemScrollController = ItemScrollController();
  ScrollController _controller = ScrollController();

  _scrollToIndex(int index) {
    _itemScrollController.scrollTo(
        index: index,
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOutCubic);
  }

  @override
  void initState() {
    super.initState();

    widgetList = [
      PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CustomAppBar(
          page: Routes.VISION,
        ),
      ),
      VisionFrame(),
      MissionFrame(),
      RoadmapFrame(
        controller: _controller,
      ),
      ExploreFrame(),
      CustomFooter(),
    ];
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.roadmap) {
        _scrollToIndex(3);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(
            width: double.infinity,
            child: ListView.builder(
              controller:
                  _controller, // Associate the ScrollController with the ListView
              itemCount: widgetList.length,
              itemBuilder: (context, index) {
                return widgetList[index];
              },
            )
            // ScrollablePositionedList.builder(

            //   itemCount: widgetList.length,
            //   itemScrollController: _itemScrollController,
            //   itemBuilder: (context, index) {
            //     return widgetList[index];
            //   },
            // ),
            ),
        drawer: CustomDrawer(),
      ),
    );
  }
}
