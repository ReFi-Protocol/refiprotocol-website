import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:viridis_web/widgets/custom_footer.dart';
import '../../routes/app_pages.dart';
import '../../utilities/responsive.dart';
import '../../widgets/animated_appbar.dart';
import '../../widgets/custom_drawer.dart';
import 'widgets/contact_frame.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  final _controller = ScrollController();

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.hasClients) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            // _controller.hasClients
            //     ? Positioned(top: 0, left: 0, child: _parallaxImage())
            //     : Container(),
            _controller.hasClients
                ? Positioned(
                    left: 0,
                    child: _parallaxImage(Image.asset(
                      "assets/images/vision_bg.png",
                    )))
                : Container(),
            _controller.hasClients
                ? Positioned(
                    right: 0,
                    child: _parallaxImage(Image.asset(
                      "assets/images/mission_bg.png",
                    )))
                : Container(),
            ListView(
              controller: _controller,
              children: [
                ContactFrame(
                  controller: _controller,
                ),
                const CustomFooter(),
              ],
            ),
            AnimatedAppbar(controller: _controller, route: Routes.CONTACT),
          ],
        ),
        drawer: const CustomDrawer(),
      ),
    );
  }

  _parallaxImage(Widget child) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          double offsetY = -_controller.offset *
              (Responsive.isDesktop(context) ? 0.625 : 0.625);
          return Transform.translate(
            offset: Offset(0, offsetY),
            child: child,
          );
        },
        child: child);
  }

  _background() {
    return Transform.flip(
      flipX: true,
      child: Image.asset(
        "assets/images/gradients.png",
        fit: BoxFit.cover,
        width: 1.sw,
        height: 1.5.sh,
      ),
    );
  }
}
