import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:viridis_web/views/home/widgets/contact_frame.dart';
import 'package:viridis_web/views/home/widgets/innovation_frame.dart';
import 'package:viridis_web/views/home/widgets/landing_frame.dart';
import 'package:viridis_web/views/home/widgets/tab_frame.dart';
import 'package:viridis_web/views/home/widgets/transparency_frame.dart';
import 'package:viridis_web/widgets/custom_drawer.dart';
import 'package:viridis_web/widgets/custom_footer.dart';
import '../../routes/app_pages.dart';
import '../../widgets/FadeInListWidget.dart';
import '../../widgets/animated_appbar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  static final double _containerHeight = 0.9.sh;
  double _fromTop = -_containerHeight;
  final _controller = ScrollController();
  bool _allowReverse = true, _allowForward = true;
  double _prevOffset = 0.0;
  double _prevForwardOffset = -_containerHeight;
  double _prevReverseOffset = 0.0;

  @override
  void initState() {
    _checkFirstLoad();
    super.initState();
    _controller.addListener(_listener);
  }

  Future<void> _checkFirstLoad() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLoad = prefs.getBool('isFirstLoad') ?? true;
    if (isFirstLoad) {
      Get.toNamed(Routes.SPLASH);
    }
  }

  void _listener() {
    double offset = _controller.offset;
    var direction = _controller.position.userScrollDirection;

    if (direction == ScrollDirection.reverse) {
      _allowForward = true;

      if (_allowReverse) {
        _allowReverse = false;
        _prevOffset = offset;
        _prevForwardOffset = _fromTop;
      }

      var difference = offset - _prevOffset;
      _fromTop = _prevForwardOffset + difference;
      if (_fromTop > 0) _fromTop = 0;
    } else if (direction == ScrollDirection.forward) {
      _allowReverse = true;

      if (_allowForward) {
        _allowForward = false;
        _prevReverseOffset = _fromTop;
      }

      var difference = offset - _prevOffset;

      if (offset > 100.0) {
        _prevOffset = offset;
      }

      if (offset < 100.0) {
        _fromTop = _prevReverseOffset + difference;
        if (_fromTop < -_containerHeight) _fromTop = -_containerHeight;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            CustomScrollView(
              controller: _controller,
              slivers: [
                SliverList(
                    delegate: SliverChildListDelegate([
                  LandingFrame(
                    controller: _controller,
                  ),
                  TransparencyFrame(
                    controller: _controller,
                  ),
                ])),
                SliverList(
                  delegate: SliverChildListDelegate([
                    const FadeInListItem(child: InnovationFrame()),
                    const FadeInListItem(child: TabFrame()),
                    const ContactFrame(),
                    const CustomFooter(),
                  ]),
                ),
              ],
            ),
            AnimatedAppbar(controller: _controller, route: Routes.HOME)
          ],
        ),
        drawer: const CustomDrawer(),
      ),
    );
  }
}
