import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viridis_web/utilities/responsive.dart';

class TeamFrame extends StatefulWidget {
  const TeamFrame({super.key});

  @override
  State<TeamFrame> createState() => _TeamFrameState();
}

class _TeamFrameState extends State<TeamFrame> {
  List<Widget> detailCards = [];

  @override
  Widget build(BuildContext context) {
    detailCards = [
      _profileCard("Bytebison", "images/bytebison.png"),
      _profileCard("Tim", "images/tim.jpeg"),
      _profileCard("Falcon", "images/falcon.jpeg"),
    ];

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.black,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: Column(children: [
        Text(
          "Our Team",
          textAlign: TextAlign.center,
          style: Responsive.getTextStyle(context,
              weight: FontWeight.w700, mSize: 35, dSize: 40),
        ),
        SizedBox(
          height: 60.h,
        ),
        Responsive(mobile: _mobileView(), desktop: _desktopView())
      ]),
    );
  }

  _desktopView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: detailCards,
    );
  }

  _mobileView() {
    return Container(
      constraints: BoxConstraints(maxHeight: 0.4.sh),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: detailCards.length,
          itemBuilder: (ctx, i) {
            return Container(
              width: 0.85.sw,
              padding: const EdgeInsets.only(right: 20),
              child: detailCards[i],
            );
          }),
    );
  }

  _profileCard(String title, String path) {
    return Container(
      width: 340.w,
      height: 430.h,
      decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(image: AssetImage(path), fit: BoxFit.fill)),
      alignment: Alignment.bottomCenter,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.28)),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: Responsive.getTextStyle(context,
                          weight: FontWeight.w500, mSize: 20, dSize: 25),
                    ),
                  ),
                ),
              ),
            )
            // BackdropFilter(
            //     filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            //     child: Container(
            //         // width: double.infinity,
            //         decoration: BoxDecoration(
            //             color: Color(0xff000000).withOpacity(0.78)),
            //         child: Text(
            //           title,
            //           textAlign: TextAlign.center,
            //           style: GoogleFonts.inter(
            //               fontSize: 30,
            //               fontWeight: FontWeight.w600,
            //               color: Colors.white),
            //         )))
          ]),
    );
  }
}
