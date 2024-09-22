import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:viridis_web/utilities/constants.dart';

import '../../../controllers/medium_controller.dart';
import '../../../utilities/responsive.dart';

class BlogsFrame extends StatefulWidget {
  const BlogsFrame({super.key});

  @override
  State<BlogsFrame> createState() => _BlogsFrameState();
}

class _BlogsFrameState extends State<BlogsFrame> {
  final ScrollController _controller = ScrollController();
  final MediumController mediumController = Get.find();

  _getItemExtent() {
    return MediaQuery.of(context).size.width *
        (Responsive.isDesktop(context) ? 0.44 : 0.85);
  }

  _getContainerPadding() {
    if (Responsive.isDesktop(context)) {
      return const EdgeInsets.symmetric(horizontal: 90, vertical: 40);
    } else {
      return const EdgeInsets.all(20);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _getContainerPadding(),
      constraints: const BoxConstraints(minHeight: 600),
      width: 1.sw,
      child: Column(children: [_body1(), const SizedBox(height: 40), _body2()]),
    );
  }

  _body1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text("We write about our findings",
              style: Responsive.getTextStyle(context,
                  weight: FontWeight.w600,
                  dSize: 34,
                  mSize: 34,
                  textColor: Colors.white)),
        ),
        Responsive.isDesktop(context) ? _scrollButtons() : Container()
      ],
    );
  }

  _body2() {
    return Column(children: [
      SizedBox(
          height: Responsive.isMobile(context) ? 750 : 500,
          child: GridView.builder(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              itemCount: mediumController.blogsList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: _getItemExtent(),
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 15,
                  crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return mediumController.blogsList[index];
              })),
      const SizedBox(height: 40),
      Responsive(
          mobile: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: _scrollButtons()),
              Expanded(child: _readMore())
            ],
          ),
          desktop: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [_readMore()],
          ))
    ]);
  }

  _readMore() {
    return TextButton(
      onPressed: () => launchMediumURL(),
      child: Text(
        "Read More",
        style: Responsive.getTextStyle(context,
            mSize: 16,
            dSize: 16,
            weight: FontWeight.w600,
            textColor: const Color(0xff07BA9B)),
      ),
    );
  }

  _scrollButtons() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      _scrollButton(Colors.black, const Color(0xff5A5A5A), Icons.chevron_left,
          () {
        setState(() {
          _controller.animateTo(_controller.offset - _getItemExtent(),
              duration: const Duration(milliseconds: 150),
              curve: Curves.linear);
        });
      }),
      const SizedBox(width: 5),
      _scrollButton(Colors.black, const Color(0xff07BA9B), Icons.chevron_right,
          () {
        _controller.animateTo(_controller.offset + _getItemExtent(),
            duration: const Duration(milliseconds: 150), curve: Curves.linear);
      })
    ]);
  }

  _scrollButton(
      Color bgColor, Color iconColor, IconData icon, Function() onTap) {
    return InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 3,
            color: bgColor,
            child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: bgColor, borderRadius: BorderRadius.circular(8)),
                child: Icon(icon, color: iconColor))));
  }
}
