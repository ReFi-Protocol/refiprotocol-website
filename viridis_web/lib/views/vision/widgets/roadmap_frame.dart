import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viridis_web/views/vision/widgets/roadmap_widget.dart';

import '../../../utilities/responsive.dart';
import '../../../widgets/dotted_circle.dart';

class RoadmapFrame extends StatefulWidget {
  const RoadmapFrame({super.key, required this.controller});
  final ScrollController controller;
  @override
  State<RoadmapFrame> createState() => _RoadmapFrameState();
}

class _RoadmapFrameState extends State<RoadmapFrame>
    with TickerProviderStateMixin {
  final GlobalKey containerKey = GlobalKey();

  getContainerPadding() {
    if (Responsive.isDesktop(context)) {
      return const EdgeInsets.symmetric(vertical: 60);
    } else {
      return const EdgeInsets.only(left: 30, right: 30, bottom: 30);
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

  _title() {
    return Text(
      "Roadmap",
      textAlign: TextAlign.center,
      style: GoogleFonts.inter(
          fontSize: 40, fontWeight: FontWeight.w600, color: Colors.white),
    );
  }

  _mobileView() {
    return Column(
      children: [
        Image.asset(
          "images/roadmap_mobile.png",
          alignment: Alignment.centerLeft,
        ),
        _title(),
        SizedBox(
          height: 40.h,
        ),
        RoadmapWidget(
          controller: widget.controller,
        )
      ],
    );
  }

  _desktopView() {
    return Column(children: [
      _title(),
      SizedBox(
        height: 40.h,
      ),
      Row(
        children: [
          Image.asset(
            "images/roadmap.png",
            alignment: Alignment.centerLeft,
          ),
          Spacer(
            flex: 1,
          ),
          // SizedBox(
          //   width: 50.w,
          // ),
          Expanded(
            flex: 4,
            child: RoadmapWidget(
              controller: widget.controller,
            ),
          )
        ],
      )
    ]);
  }

  _details() {
    return Container(
      key: containerKey,
      child: Column(
        children: [
          _roadmapDetail("Viridis Network Launch", [
            "Q4 2023 - ERC20 Token Release",
            "Q4 2023 - Creation of V1 Whitepaper and Documentation",
            "Q4 2023 - Viridis Network at COP28",
          ]),
          _roadmapDetail(
            "Development of L1 Blockchain Platform",
            [
              "Q1 2024 - Viridis L2 Testnet",
              "Q1 2024 - Architecture Formulation of Wrapped Carbon (wCRBN) NFTs",
              "Q1 2024 - Viridis EVM Testnet Staking and Airdrop",
              "Q2 2024 - Partnership with Validation/Verification Body (VVB)"
            ],
          ),
          _roadmapDetail(
              "Viridis Network L1 Blockchain Launch",
              [
                "Q2 2024 - Mainnet Explorer, Bridging and Staking Platform",
                "Q2 2024 - Carbon Ambassador Program",
                "Q2 2024 - wCRBN Issuance",
              ],
              inProgress: true,
              completed: false,
              divider: Container(
                width: 2,
                height: getContainerHeight(containerKey),
                color: Color(0xff393A3A),
              )),
          _roadmapDetail(
              "DApp and NFT Marketplace",
              [
                "Unified VRD DApp",
                "Rebrand",
                "Decentralization of Validation/Verification Bodies (VVBs)",
                "Onboarding of Derivative Products",
              ],
              completed: false,
              textColor: Color(0xff444141),
              divider: Container())
        ],
      ),
    );
  }

  late AnimationController _controller;
  late final Animation<double> _valueAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    _valueAnimation = Tween<double>(
      begin: 0.0,
      end: 70,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
    _controller.forward();
  }

  _roadmapDetail(String title, List<String> details,
      {bool completed = true,
      bool inProgress = false,
      Widget? divider,
      Color textColor = Colors.white}) {
    return AnimatedBuilder(
        animation: _valueAnimation,
        builder: ((context, child) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  inProgress
                      ? DottedCircle(
                          color: Color(0xff07BA9B),
                          radius: 20,
                          strokeWidth: 3,
                          gap: 10,
                        )
                      : Icon(
                          Icons.check_circle,
                          size: 40,
                          color:
                              completed ? Color(0xff07BA9B) : Color(0xff393A3A),
                        ),
                  divider ??
                      Container(
                        width: 2,
                        height: getContainerHeight(containerKey),
                        child: Stack(children: [
                          Container(
                            height: getContainerHeight(containerKey),
                            color: Colors.grey,
                          ),
                          Container(
                            height: (_valueAnimation.value / 100) *
                                getContainerHeight(containerKey),
                            color: Color(0xff07BA9B),
                          ),
                        ]),
                      ),
                ],
              ),
              SizedBox(
                width: 40.w,
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 0.7.sw),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Responsive.getTextStyle(context,
                          mSize: 20,
                          dSize: 25,
                          weight: FontWeight.w600,
                          textColor: textColor),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    for (String detail in details)
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Text(
                          detail,
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: textColor),
                        ),
                      )
                  ],
                ),
              ),
            ],
          );
        }));
  }

  double getContainerHeight(GlobalKey key) {
    final RenderBox? renderBox =
        key.currentContext?.findRenderObject() as RenderBox?;
    return (renderBox?.size.height ?? 1.2.sh) * 0.25;
  }
}
