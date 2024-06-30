import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viridis_web/utilities/responsive.dart';

import '../../../widgets/gradient_text.dart';

class TabFrame extends StatefulWidget {
  const TabFrame({super.key});

  @override
  State<TabFrame> createState() => _TabFrameState();
}

class _TabFrameState extends State<TabFrame> with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _animationController;
  late List<String> tabs;
  late List<Widget> tabData;

  _getContainerPadding() {
    if (Responsive.isDesktop(context)) {
      return const EdgeInsets.symmetric(horizontal: 65, vertical: 30);
    } else {
      return const EdgeInsets.symmetric(horizontal: 20, vertical: 30);
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        _animationController.reset();
        _animationController.forward();
      }
    });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Animation completed, move to the next tab
        if (_tabController.index < _tabController.length - 1) {
          _tabController.animateTo(_tabController.index + 1);
        } else {
          _tabController.animateTo(0);
        }
      }
    });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    tabs = [
      "Rent pCRBN",
      "Stake \$VRD",
      "Sustainable Future",
      // "Carbon Offset Metadata Certificate"
    ];

    tabData = [
      _tabData(
          "Rent pCRBN(Wrapped Carbon NFTS)",
          "Using the on-chain native gas token \$VRD, you will be able to trade the pCRBN NFTs attributed with on-chain metadata",
          "assets/images/tab_1.png"),
      _tabData(
          "Stake \$VRD",
          "Wallets with the pCRBN are eligible to stake their \$VRD for a high APY. This approach systematically increases the Total Value Locked (TVL) and stabilizes the value of \$VRD, encouraging long-term investment and participation",
          "assets/images/tab_2.png"),
      // _tabData(
      //     "Carbon Offset Metadata Certificate",
      //     "Together, they synergize their roles to bring forth your EcoToken-WnCRBN certificate—a collective effort in creating a testament to a sustainable future",
      //     "assets/images/tab_3.png"),
      _tabData(
          "Sustainable Future",
          "By renting pCRBN NFTs, you contribute to the permanence of carbon offset projects and demonstrate your commitment to a sustainable future. This system not only supports environmental goals but also showcases your dedication to making a positive impact.",
          "assets/images/tab_3.png"),
    ];
    return Container(
      constraints:
          BoxConstraints(minHeight: Responsive.isDesktop(context) ? 650 : 850),
      height: Responsive.isDesktop(context) ? 0.95.sh : 955,
      padding: _getContainerPadding(),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.black,
      ),
      child: Responsive(mobile: _mobileView(), desktop: _desktopView()),
    );
  }

  _desktopView() {
    return Column(
      children: [
        Text(
          "How it works",
          style: GoogleFonts.inter(
              fontSize: 40, fontWeight: FontWeight.w900, color: Colors.white),
        ),
        SizedBox(
          height: 50.h,
        ),
        _tabBar(),
        SizedBox(
          height: 30.h,
        ),
        Expanded(
          child: Container(
              padding: EdgeInsets.all(15),
              child: TabBarView(
                controller: _tabController,
                children: tabData,
              )),
        ),
      ],
    );
  }

  _mobileView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "How it works",
          style: GoogleFonts.inter(
              fontSize: 40, fontWeight: FontWeight.w900, color: Colors.white),
        ),
        SizedBox(
          height: 50.h,
        ),
        GradientText(
          text: "Carbon neutrality",
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
        _mobileTabBar(),
        Expanded(
          child: Container(
              padding: EdgeInsets.all(15),
              child: TabBarView(
                controller: _tabController,
                children: tabData,
              )),
        ),
      ],
    );
  }

  _mobileTabBar() {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 0; i < tabs.length; i++)
                  i == _tabController.index
                      ? Stack(
                          children: [
                            Container(
                                height: 2,
                                width: 0.4.sw,
                                color: Colors.grey.withOpacity(0.2)),
                            Container(
                              // alignment: Alignment.centerLeft,
                              height: 2,
                              width: _animationController
                                  .drive(Tween<double>(begin: 0, end: 0.4.sw))
                                  .value,
                              color: Colors.white,
                            )
                          ],
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              _tabController.animateTo(i);
                            });
                          },
                          child: Container(
                            height: 2,
                            width: 0.13.sw,
                            color: Colors.grey.withOpacity(0.2),
                          ))
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "0${_tabController.index + 1}",
              style: Responsive.getTextStyle(context,
                  weight: FontWeight.w500, dSize: 22, mSize: 22),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(tabs[_tabController.index],
                style: Responsive.getTextStyle(context,
                    weight: FontWeight.w500, dSize: 22, mSize: 22)),
          ],
        );
      },
    );
  }

  _tabBar() {
    return Container(
      color: Colors.black,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return TabBar(
            indicatorColor: Colors.transparent,
            controller: _tabController,
            dividerColor: Colors.black,
            labelStyle:
                GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w500),
            labelColor: Colors.white,
            unselectedLabelStyle:
                GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w600),
            unselectedLabelColor: Color(0xff787878),
            tabs: [
              _tab("01", tabs[0], _tabController.index == 0),
              _tab("02", tabs[1], _tabController.index == 1),
              _tab("03", tabs[2], _tabController.index == 2),
              // _tab("04", tabs[3], _tabController.index == 3)
            ],
          );
        },
      ),
    );
  }

  _tab(String index, String tabName, bool isSelected) {
    return SizedBox(
      height: 172.h,
      width: 0.2.sw,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              isSelected
                  ? Divider(
                      color: Colors.white,
                      endIndent: _animationController
                          .drive(Tween<double>(end: 0, begin: 0.2.sw))
                          .value,
                      thickness: 2,
                    )
                  : Container(),
              Divider(color: Colors.grey.withOpacity(0.2), thickness: 2)
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(index),
          SizedBox(
            height: 10.h,
          ),
          Text(tabName)
        ],
      ),
    );
  }

  _tabData(String title, String data, String path) {
    return Responsive(
        mobile: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 500.h),
              child: Image.asset(
                path,
              ),
            )),
            SizedBox(
              height: 20.h,
            ),
            Text(data,
                style: Responsive.getTextStyle(context,
                    weight: FontWeight.w300,
                    dSize: 24,
                    mSize: 18,
                    textColor: Colors.white)),
            SizedBox(
              height: 20.h,
            ),
            // InkWell(
            //   onTap: () {},
            //   child: Text(
            //     "Learn More >",
            //     style: GoogleFonts.inter(
            //         fontSize: 14,
            //         fontWeight: FontWeight.w600,
            //         color: Colors.white),
            //   ),
            // )
          ],
        ),
        desktop: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 0.5.sw),
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GradientText(
                    text: title,
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xff07BA9A),
                        Colors.white
                      ], // define your gradient colors
                    ),
                    style: GoogleFonts.inter(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  // SizedBox(
                  //   height: 80.h,
                  // ),
                  Text(
                    data,
                    style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Learn More >",
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 80.w,
            ),
            Expanded(
              child: Image.asset(path),
            ),
          ],
        ));
  }

  @override
  void dispose() {
    _tabController.dispose();
    _animationController.dispose();
    super.dispose();
  }
}
