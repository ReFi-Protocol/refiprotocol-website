import 'package:flutter/material.dart';
import 'package:viridis_web/views/application/widgets/working_frame.dart';
import '../../utilities/responsive.dart';
import 'widgets/explore_frame.dart';
import 'package:viridis_web/widgets/animated_appbar.dart';
import 'package:viridis_web/widgets/custom_footer.dart';
import '../../routes/app_pages.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_drawer.dart';
import 'widgets/landing_frame.dart';

class ApplicationView extends StatefulWidget {
  const ApplicationView({super.key, this.roadmap = false});
  final bool roadmap;

  @override
  State<ApplicationView> createState() => _ApplicationViewState();
}

class _ApplicationViewState extends State<ApplicationView> {
  List<Widget> widgetList = [];
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
          child: Stack(
            children: <Widget>[
              ListView(
                controller: _controller,
                children: [
                  const PreferredSize(
                    preferredSize: Size.fromHeight(80),
                    child: CustomAppBar(
                      page: Routes.DASHBOARD,
                    ),
                  ),
                  Stack(
                    children: [
                      Responsive(
                        mobile: Container(),
                        desktop: AnimatedBuilder(
                            animation: _controller,
                            builder: (context, child) {
                              double offsetY = _controller.offset * (0.15);
                              return Transform.translate(
                                offset: Offset(0, offsetY),
                                child: child,
                              );
                            },
                            child: Image.asset("assets/images/dots_bg.png")),
                      ),
                      Column(
                        children: [
                          LandingFrame(
                            controller: _controller,
                          ),
                          const WorkingFrame(),
                        ],
                      )
                    ],
                  ),
                  const ExploreFrame(),
                  const CustomFooter(),
                ],
              ),
              AnimatedAppbar(
                controller: _controller,
                route: Routes.DASHBOARD,
              )
            ],
          ),
        ),
        drawer: const CustomDrawer(),
      ),
    );
  }
}
