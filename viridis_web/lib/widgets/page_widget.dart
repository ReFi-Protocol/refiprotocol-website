import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utilities/responsive.dart';

class PageWidget extends StatefulWidget {
  PageWidget(
      {super.key,
      required this.image_path,
      required this.title,
      required this.detail});
  String image_path;
  String title;
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
        child: Responsive(mobile: _mobileView(), desktop: _desktopView()));
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
              padding: const EdgeInsets.only(left: 20, top: 70),
              // width: 1.sw,
              child: Image.asset(
                widget.image_path,
              )),
        )
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
                  weight: FontWeight.w600, mSize: 22, dSize: 40),
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
