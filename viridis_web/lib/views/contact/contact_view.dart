import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:viridis_web/widgets/custom_footer.dart';
import '../../routes/app_pages.dart';
import '../../utilities/responsive.dart';
import '../../widgets/animated_appbar.dart';
import '../../widgets/custom_appbar.dart';
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
            _controller.hasClients
                ? Positioned(top: 0, left: 0, child: _parallaxImage())
                : Container(),
            ListView(
              controller: _controller,
              children: [
                ContactFrame(
                  controller: _controller,
                ),
                CustomFooter(),
              ],
            ),
            AnimatedAppbar(controller: _controller, route: Routes.CONTACT),
          ],
        ),
        drawer: CustomDrawer(),
      ),
    );
  }

  _parallaxImage() {
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
        child: _background());
  }

  _background() {
    return Transform.flip(
      flipX: true,
      child: Image.asset(
        "images/gradients.png",
        fit: BoxFit.cover,
        width: 1.sw,
        height: 1.5.sh,
      ),
    );
  }
}
