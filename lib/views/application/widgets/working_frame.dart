import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:viridis_web/widgets/FadeInListWidget.dart';

import '../../../utilities/responsive.dart';

class WorkingFrame extends StatefulWidget {
  const WorkingFrame({super.key});

  @override
  State<WorkingFrame> createState() => _WorkingFrameState();
}

class _WorkingFrameState extends State<WorkingFrame> {
  final ScrollController _controller = ScrollController();

  List dataList = [];

  _getItemExtent() {
    return 400;
  }

  _getCrossAxisItems() {
    if (Responsive.isDesktop(context)) {
      return 3;
    } else if (Responsive.isMobile(context)) {
      return 1;
    } else {
      return 2;
    }
  }

  _getContainerPadding() {
    if (Responsive.isDesktop(context)) {
      return const EdgeInsets.symmetric(horizontal: 90, vertical: 40);
    } else {
      return const EdgeInsets.all(20);
    }
  }

  @override
  Widget build(BuildContext context) {
    dataList = [
      _detailItem(
          1,
          "Bridging",
          "Unlock the full potential of your \$REFI by bridging seamlessly between different blockchain networks",
          "assets/images/step_1.png"),
      _detailItem(
          2,
          "pCRBN",
          "With on-chain native gas token \$REFI, you will be able to trade the pCRBN NFTs attributed with on-chain metadata",
          "assets/images/nft_image.png",
          coverImage: false),
      _detailItem(
          3,
          "NFT purchase",
          "Explore, buy, and own exclusive NFTs effortlessly through our comprehensive purchasing platform",
          "assets/images/step_3.png"),
      _detailItem(
          4,
          "Staking",
          "Maximize your crypto holdings by earning rewards through simple and secure staking opportunities",
          "assets/images/step_4.png"),
      _detailItem(
          5,
          "Restaking",
          "Optimize your earnings by automatically relocking rewards through our effortless restaking process",
          "assets/images/step_5.png"),
      _detailItem(
          6,
          "Analytics",
          "Gain deep insights into your \$REFI performance performance with portfolio analytics and real-time data visualization",
          "assets/images/step_6.png"),
    ];

    return Container(
      padding: _getContainerPadding(),
      constraints: const BoxConstraints(minHeight: 600),
      width: 1.sw,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [_body1(), const SizedBox(height: 40), _body2()]),
    );
  }

  _body1() {
    return FadeInListItem(
        duration: const Duration(milliseconds: 150),
        child: Text("Here’s how it works",
            style: Responsive.getTextStyle(context,
                weight: FontWeight.w600,
                dSize: 34,
                mSize: 34,
                textColor: Colors.white)));
  }

  _body2() {
    return SizedBox(
        height: Responsive.isMobile(context)
            ? 440 * 6
            : Responsive.isDesktop(context)
                ? 850
                : 440 * 3,
        child: GridView.builder(
            controller: _controller,
            itemCount: dataList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: _getItemExtent(),
                crossAxisSpacing: 40,
                mainAxisSpacing: 40,
                crossAxisCount: _getCrossAxisItems()),
            itemBuilder: (BuildContext context, int index) {
              return FadeInListItem(
                  duration: Duration(
                      milliseconds: 400 *
                          (Responsive.isMobile(context) ? 1 : (index + 1))),
                  child: dataList[index]);
            }));
  }

  _detailItem(int index, String title, String data, String path,
      {bool coverImage = true}) {
    const double radius = 10;
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff555555)),
          borderRadius: BorderRadius.circular(radius)),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(radius),
                      topLeft: Radius.circular(radius)),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                            image: AssetImage(path),
                            fit: coverImage ? BoxFit.cover : BoxFit.contain)),
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(radius)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Responsive.getTextStyle(context,
                              dSize: 22,
                              mSize: 18,
                              dWeight: FontWeight.w600,
                              textColor: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          data,
                          style: Responsive.getTextStyle(context,
                              dSize: 14,
                              mSize: 13,
                              dWeight: FontWeight.w400,
                              textColor: Colors.white),
                        )
                      ],
                    ),
                  ))
            ],
          ),
          Positioned(
              top: 5,
              left: 20,
              child: Text(
                "$index",
                style: Responsive.getTextStyle(context,
                    dSize: 72,
                    mSize: 45,
                    dWeight: FontWeight.w400,
                    textColor: Colors.white),
              )),
        ],
      ),
    );
  }
}
