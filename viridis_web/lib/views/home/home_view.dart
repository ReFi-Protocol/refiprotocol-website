import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:viridis_web/utilities/responsive.dart';
import 'package:viridis_web/views/home/widgets/contact_frame.dart';
import 'package:viridis_web/views/home/widgets/innovation_frame.dart';
import 'package:viridis_web/views/home/widgets/landing_frame.dart';
import 'package:viridis_web/views/home/widgets/tab_frame.dart';
import 'package:viridis_web/views/home/widgets/transparency_frame.dart';
import 'package:viridis_web/widgets/custom_drawer.dart';
import 'package:viridis_web/widgets/custom_footer.dart';
import '../../routes/app_pages.dart';
import '../../utilities/parralax_flow_delegate.dart';
import '../../widgets/custom_appbar.dart';

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
    super.initState();
    _controller.addListener(_listener);
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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            _listView(),
            Positioned(
              top: _fromTop,
              left: 0,
              right: 0,
              child: const CustomAppBar(
                bgColor: Colors.black,
                page: Routes.SPLASH,
              ),
            )
          ],
        ),
        drawer: const CustomDrawer(),
      ),
    );
  }

  _listView() {
    return ListView(
      controller: _controller,
      children: [
        LandingFrame(
          controller: _controller,
        ),
        TransparencyFrame(
          controller: _controller,
        ),
        InnovationFrame(),
        TabFrame(),
        ContactFrame(),
        CustomFooter(),
      ],
    );
  }
}
