import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/innovation_container.dart';

class InnovationFrame extends StatefulWidget {
  const InnovationFrame({super.key});

  @override
  State<InnovationFrame> createState() => _InnovationFrameState();
}

class _InnovationFrameState extends State<InnovationFrame>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  // int _currentPageIndex = 0;
  List<Widget> detailCards = const [
    InnovationContainer(
        title: "DePIN (Decentralized Physical Infrastructure)",
        image_path: "assets/images/detail_1.png",
        selectedColor: Colors.yellow,
        detail:
            "Edge computing enables trustless data capture for carbon offsetting projects. These Decentralized Physical Infrastructure (DePIN) devices will collect environmental data, such as temperature, humidity, and CO2 levels, for project developers and transmit it securely to our blockchain platform."),
    InnovationContainer(
        title: "AI for validation and verification",
        image_path: "assets/images/detail_2.png",
        selectedColor: Colors.blue,
        selectedTextColor: Colors.white,
        detail:
            "Verifies the credibility of our tokenized carbon projects, ensuring both pre- and post-retirement integrity. This technology provides continuous, automated validation, reducing the risk of human error and fraud, and enhancing the trustworthiness of carbon reduction activities."),
    InnovationContainer(
        title: "Tokenization of Carbon Projects",
        image_path: "assets/images/nft_image.png",
        selectedColor: Colors.white,
        detail:
            "Our carbon projects are tokenized into Project Carbon (pCRBN) NFTs, which store the project and ownership metadata. This innovative approach ensures that each NFT represents a verified portion of a carbon project, providing transparency and enhancing market trust."),
    InnovationContainer(
        title: "Rewards for Sustainability",
        image_path: "assets/images/detail_4.png",
        selectedColor: Color(0xff46F9F2),
        detail:
            "Through the renting of pCRBN NFTs, any user or organization will retain temporary ownership of the underlying asset. Wallets holding these NFTs are then eligible for additional rewards via staking, incentivizing sustainable practices and contributing to long-term project viability.")
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(children: [
        Text(
          "Our Innovation",
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
              fontSize: 40, fontWeight: FontWeight.w900, color: Colors.white),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "Trust. Transparency. Transformation.",
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
              fontSize: 21, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        SizedBox(
          height: 10.h,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int i = 0; i < detailCards.length; i++)
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: detailCards[i],
                )
            ],
          ),
        ),
      ]),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }
}
