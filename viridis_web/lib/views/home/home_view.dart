import 'package:flutter/material.dart';
import 'package:viridis_web/views/home/widgets/contact_frame.dart';
import 'package:viridis_web/views/home/widgets/innovation_frame.dart';
import 'package:viridis_web/views/home/widgets/landing_frame.dart';
import 'package:viridis_web/views/home/widgets/transparency_frame.dart';
import '../../routes/app_pages.dart';
import '../../widgets/custom_appbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                PreferredSize(
                  preferredSize: Size.fromHeight(80),
                  child: CustomAppBar(
                    page: Routes.HOME,
                  ),
                ),
                LandingFrame(),
                TransparencyFrame(),
                InnovationFrame(),
                ContactFrame()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
