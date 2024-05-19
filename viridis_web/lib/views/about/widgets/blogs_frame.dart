import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utilities/responsive.dart';

class BlogsFrame extends StatefulWidget {
  const BlogsFrame({super.key});

  @override
  State<BlogsFrame> createState() => _BlogsFrameState();
}

class _BlogsFrameState extends State<BlogsFrame> {
  final ScrollController _controller = ScrollController();

  List<Widget> _blogsList = [];

  _getItemExtent() {
    return Responsive.isDesktop(context)
        ? MediaQuery.of(context).size.width * 0.45
        : MediaQuery.of(context).size.width * 0.85;
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
    _blogsList = [
      _blogIntro(
          "images/blogs_intro-1.png",
          "November 16, 2014",
          "The Viridis Vision: Setting New Standards in Carbon Market Trust and Transparency",
          "Building upon the discussion from our previous article on the pivotal role of carbon credits in combatting......"),
      _blogIntro(
          "images/blogs_intro-3.png",
          "September 24, 2017",
          "Transforming Business with VRD: The Carbon Offsetting Advantage",
          "In an era marked by escalating climate concerns, corporations face mounting pressure for environmental accountability. California’s recent move....."),
      _blogIntro(
          "images/blogs_intro-2.png",
          "November 16, 2014",
          "Unpacking Carbon Credits: The Role of Verification and Validation Bodies",
          "In the global effort to combat climate change, carbon credits have emerged as valuable tools...."),
      _blogIntro(
          "images/blogs_intro-4.png",
          "September 24, 2017",
          "Lessons from Unsuccessful Blockchain Carbon Credits Initiatives: Insights for VRD",
          "Carbon credits and blockchain technology have recently converged to revolutionize the way we track, trade...."),
      _blogIntro(
          "images/blogs_intro-1.png",
          "November 16, 2014",
          "The Viridis Vision: Setting New Standards in Carbon Market Trust and Transparency",
          "Building upon the discussion from our previous article on the pivotal role of carbon credits in combatting......"),
      _blogIntro(
          "images/blogs_intro-3.png",
          "September 24, 2017",
          "Transforming Business with VRD: The Carbon Offsetting Advantage",
          "In an era marked by escalating climate concerns, corporations face mounting pressure for environmental accountability. California’s recent move....."),
      _blogIntro(
          "images/blogs_intro-2.png",
          "November 16, 2014",
          "Unpacking Carbon Credits: The Role of Verification and Validation Bodies",
          "In the global effort to combat climate change, carbon credits have emerged as valuable tools...."),
      _blogIntro(
          "images/blogs_intro-4.png",
          "September 24, 2017",
          "Lessons from Unsuccessful Blockchain Carbon Credits Initiatives: Insights for VRD",
          "Carbon credits and blockchain technology have recently converged to revolutionize the way we track, trade...."),
    ];
    return Container(
      padding: _getContainerPadding(),
      width: MediaQuery.of(context).size.width,
      child: Column(children: [_body1(), const SizedBox(height: 40), _body2()]),
    );
  }

  _body1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Our blogs",
            style: Responsive.getTextStyle(context,
                weight: FontWeight.w600,
                dSize: 34,
                mSize: 34,
                textColor: Colors.white)),
        Responsive.isDesktop(context) ? _scrollButtons() : Container()
      ],
    );
  }

  _body2() {
    return Column(children: [
      ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: Responsive.isDesktop(context)
                  ? MediaQuery.of(context).size.height * 0.65
                  : MediaQuery.of(context).size.height * 0.95),
          child: GridView.builder(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              itemCount: _blogsList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: _getItemExtent(),
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return _blogsList[index];
              })),
      const SizedBox(height: 10),
      Responsive.isMobile(context) ? _scrollButtons() : Container()
    ]);
  }

  _blogIntro(String path, String date, String title, String data) {
    return InkWell(
        onTap: () {},
        child: Responsive(
            mobile: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Image.asset(
                    path,
                    fit: BoxFit.cover,
                  )),
                  const SizedBox(height: 15),
                  _blogIntroData(date, title, data)
                ]),
            desktop:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Expanded(
                  child: Image.asset(
                path,
                fit: BoxFit.cover,
              )),
              const SizedBox(width: 15),
              Expanded(child: _blogIntroData(date, title, data))
            ])));
  }

  _blogIntroData(String date, String title, String data) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(date,
                  style: Responsive.getTextStyle(context,
                      weight: FontWeight.w600,
                      dSize: 14,
                      mSize: 16,
                      textColor: Color(0xff07BA9B))),
              const SizedBox(height: 10),
              Text(title,
                  style: Responsive.getTextStyle(context,
                      weight: FontWeight.w600,
                      dSize: 18,
                      mSize: 16,
                      textColor: Colors.white)),
            ]),
            Text(data,
                style: Responsive.getTextStyle(context,
                    weight: FontWeight.w400,
                    dSize: 16,
                    mSize: 14,
                    textColor: Color(0xffAEAEAE)))
          ]),
    );
  }

  _scrollButtons() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      _scrollButton(Colors.black, Color(0xff5A5A5A), Icons.chevron_left, () {
        setState(() {
          _controller.animateTo(_controller.offset - _getItemExtent(),
              duration: const Duration(milliseconds: 90), curve: Curves.linear);
        });
      }),
      const SizedBox(width: 5),
      _scrollButton(Colors.black, Color(0xff07BA9B), Icons.chevron_right, () {
        _controller.animateTo(_controller.offset + _getItemExtent(),
            duration: const Duration(milliseconds: 90), curve: Curves.linear);
      })
    ]);
  }

  _scrollButton(
      Color bgColor, Color iconColor, IconData icon, Function() onTap) {
    return InkWell(
        onTap: onTap,
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
