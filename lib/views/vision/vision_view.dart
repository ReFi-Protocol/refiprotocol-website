import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/medium_controller.dart';
import '../../routes/app_pages.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_drawer.dart';
import '../../widgets/animated_appbar.dart';
import '../../widgets/custom_footer.dart';
import 'widgets/blogs_frame.dart';
import 'widgets/vision_frame.dart';
import 'widgets/prepared_frame.dart';

class VisionView extends StatefulWidget {
  const VisionView({super.key});

  @override
  State<VisionView> createState() => _VisionViewState();
}

class _VisionViewState extends State<VisionView> {
  List<Widget> widgetList = [];
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MediumController mediumController = Get.put(MediumController());
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
                Obx(() {
                  if (mediumController.blogsList.isNotEmpty) {
                    return const BlogsFrame();
                  } else {
                    return Container();
                  }
                }),
                const PreparedFrame(),
                const CustomFooter(),
              ],
            ),
            AnimatedAppbar(
              controller: _controller,
              route: Routes.VISION,
            )
          ],
        ),
        drawer: const CustomDrawer(),
      ),
    );
  }
}
