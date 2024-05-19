import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utilities/responsive.dart';

class AboutDetailFrame extends StatefulWidget {
  const AboutDetailFrame({super.key});

  @override
  State<AboutDetailFrame> createState() => _AboutDetailFrameState();
}

class _AboutDetailFrameState extends State<AboutDetailFrame> {
  _getContainerPadding() {
    if (Responsive.isDesktop(context)) {
      return const EdgeInsets.only(top: 80, left: 80);
    } else {
      return const EdgeInsets.only(left: 30, top: 30);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: _getContainerPadding(),
      decoration: BoxDecoration(color: Color(0xff03040C)),
      child: Responsive(
        desktop: _desktopView(),
        mobile: _mobileView(),
      ),
    );
  }

  _desktopView() {
    return Container(
      height: 1.1.sh,
      child: Stack(children: [
        Container(
          alignment: Alignment.bottomRight,
          child: Image.asset("images/about_detail.png"),
        ),
        Container(
          constraints: BoxConstraints(maxWidth: 0.5.sw),
          alignment: Alignment.topLeft,
          child: _textColumn(),
        ),
      ]),
    );
  }

  _mobileView() {
    return Column(children: [
      ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 0.8.sw),
        child: _textColumn(),
      ),
      SizedBox(
        height: 30,
      ),
      _image(),
    ]);
  }

  _image() {
    return Image.asset("images/about_detail.png");
  }

  _textColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "In propelling the advancement of environmental finance and seizing opportunities, we're actively crafting three essential products.",
          style: Responsive.getTextStyle(context,
              mWeight: FontWeight.w700,
              dWeight: FontWeight.w500,
              mSize: 25,
              dSize: 25,
              textColor: Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Establishing a comprehensive and tokenized framework for the decentralized verification, classification, and ownership of carbon credits through the harnessing of blockchain technology",
          textAlign: TextAlign.left,
          style: Responsive.getTextStyle(context,
              weight: FontWeight.w500, mSize: 16, dSize: 16),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Facilitating direct engagement with the governance process of Viridis while incorporating tokens to incentivize active participation.",
          textAlign: TextAlign.left,
          style: Responsive.getTextStyle(context,
              weight: FontWeight.w500, mSize: 16, dSize: 16),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Introducing a Project Development Gateway to scale supply in the VCM.",
          textAlign: TextAlign.left,
          style: Responsive.getTextStyle(context,
              weight: FontWeight.w500, mSize: 16, dSize: 16),
        ),
      ],
    );
  }
}
