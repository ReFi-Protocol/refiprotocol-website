import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utilities/responsive.dart';
import 'gradient_text.dart';

class PageWidget extends StatefulWidget {
  PageWidget(
      {super.key,
      required this.image_path,
      required this.header,
      required this.title,
      required this.detail});
  String image_path;
  String title;
  String header;
  String detail;

  @override
  State<PageWidget> createState() => _PageWidgetState();
}

class _PageWidgetState extends State<PageWidget> {
  getContainerPadding() {
    if (Responsive.isDesktop(context)) {
      return const EdgeInsets.only(left: 120, right: 60, top: 60, bottom: 60);
    } else {
      return const EdgeInsets.symmetric(horizontal: 30, vertical: 30);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: Colors.black,
        ),
        padding: getContainerPadding(),
        child: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 600),
              child: GradientText(
                text: widget.header,
                alignment: TextAlign.center,
                gradient: const LinearGradient(
                  colors: [
                    Color(0xff07BA9A),
                    Colors.white
                  ], // define your gradient colors
                ),
                style: Responsive.getTextStyle(context,
                    weight: FontWeight.w600,
                    dSize: 40,
                    mSize: 28,
                    textColor: Colors.white),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Expanded(
                child:
                    Responsive(mobile: _mobileView(), desktop: _desktopView()))
          ],
        ));
  }

  _desktopView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
            flex: 6,
            child: Image.asset(
              widget.image_path,
              // fit: BoxFit.cover,
            )),
        const Spacer(),
        Expanded(flex: 6, child: _textBody()),
      ],
    );
  }

  _mobileView() {
    return Column(
      children: [
        _textBody(),
        Expanded(
            child: Container(
                padding: const EdgeInsets.only(left: 20, top: 20),
                // width: 1.sw,
                child: Image.asset(
                  widget.image_path,
                )))
      ],
    );
  }

  _textBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 50.h),
                child: const VerticalDivider(
                  width: 20,
                  thickness: 4,
                  color: Color(0xff07BA9B),
                )),
            Expanded(
                child: Text(
              widget.title,
              style: Responsive.getTextStyle(context,
                  weight: FontWeight.w600, mSize: 20, dSize: 30),
            ))
          ],
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, top: 40),
          child: Text(
            widget.detail,
            textAlign: TextAlign.justify,
            style: Responsive.getTextStyle(context,
                weight: FontWeight.w400, mSize: 16, dSize: 17),
          ),
        )
      ],
    );
  }
}
