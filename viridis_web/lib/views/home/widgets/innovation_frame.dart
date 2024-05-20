import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viridis_web/utilities/responsive.dart';
import 'package:viridis_web/widgets/page_widget.dart';

import '../../../widgets/page_indicator.dart';

class InnovationFrame extends StatefulWidget {
  const InnovationFrame({super.key});

  @override
  State<InnovationFrame> createState() => _InnovationFrameState();
}

class _InnovationFrameState extends State<InnovationFrame>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;
  List<Widget> detailCards = [
    PageWidget(
        image_path: "images/detail_1.png",
        title: "Decentralized Edge Computing for Project Developers",
        detail:
            "IoT devices enable trustless data capture for carbon offsetting projects. These Decentralized Physical Infrastructure (DePIN) devices will collect environmental data, such as temperature, humidity, and CO2 levels, for project developers and transmit it securely to our blockchain platform."),
    PageWidget(
        image_path: "images/detail_2.png",
        title: "AI Integration for VVBs",
        detail:
            "Once this data is on the chain, the validation and verification process will be automated through the implementation of our AI tool. This will ensure that the remote data transmitted continuously verifies the credibility of our carbon credits before and after retirement."),
    PageWidget(
        image_path: "images/detail_3.png",
        title: "Tokenization of Carbon Credits into Wrapped Carbon NFTs",
        detail:
            "Upon successful validation and verification conducted by globally recognized organisations designated by the UNFCCC, our carbon credits are tokenized into Wrapped Carbon (wCRBN) NFTs, which store the environmental data as metadata."),
    PageWidget(
        image_path: "images/detail_4.png",
        title: "Organization Carbon Emission Reduction (CER)",
        detail:
            "Through the burning of Viridis Network’s wCRBN NFTs (digitized carbon credits), any user or organization may mint bCRBN NFTs, representing the retirement of the carbon credits. In return, users or organizations will receive a quantity specific certificate showcasing their CER.")
  ];

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: detailCards.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.black,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: Column(children: [
        Text(
          "Our Innovation",
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
              fontSize: 40, fontWeight: FontWeight.w900, color: Colors.white),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          "Trust. Transparency. Transformation.",
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
              fontSize: 21, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        SizedBox(
          height: 40.h,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: Responsive.isDesktop(context) ? 0.7.sh : 0.8.sh),
          child: PageView(
            controller: _pageViewController,
            onPageChanged: _handlePageViewChanged,
            children: detailCards,
          ),
        ),
        PageIndicator(
          tabController: _tabController,
          currentPageIndex: _currentPageIndex,
          onUpdateCurrentPageIndex: _updateCurrentPageIndex,
        ),
      ]),
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }
}
