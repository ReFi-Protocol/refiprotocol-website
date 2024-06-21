import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:viridis_web/widgets/custom_footer.dart';
import '../../routes/app_pages.dart';
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            ListView(
              controller: _controller,
              children: [
                ContactFrame(
                  controller: _controller,
                ),
                CustomFooter(),
              ],
            ),
            AnimatedAppbar(controller: _controller, route: Routes.CONTACT)
          ],
        ),
        drawer: CustomDrawer(),
      ),
    );
  }
}
