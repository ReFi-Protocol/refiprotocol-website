import 'package:flutter/material.dart';
import 'package:viridis_web/views/home/widgets/contact_frame.dart';
import 'package:viridis_web/views/home/widgets/innovation_frame.dart';
import 'package:viridis_web/views/home/widgets/landing_frame.dart';
import 'package:viridis_web/views/home/widgets/tab_frame.dart';
import 'package:viridis_web/views/home/widgets/transparency_frame.dart';
import 'package:viridis_web/widgets/custom_footer.dart';
import '../../routes/app_pages.dart';
import '../../widgets/custom_appbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "images/bg_landing_frame.png",
                        ),
                        fit: BoxFit.cover),
                    color: Colors.black,
                  ),
                  child: const Column(
                    children: [
                      PreferredSize(
                        preferredSize: Size.fromHeight(80),
                        child: CustomAppBar(
                          page: Routes.HOME,
                        ),
                      ),
                      LandingFrame(),
                    ],
                  ),
                ),
                const TransparencyFrame(),
                const InnovationFrame(),
                const TabFrame(),
                const ContactFrame(),
                const CustomFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
