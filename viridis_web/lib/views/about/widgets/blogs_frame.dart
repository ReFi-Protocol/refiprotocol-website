import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:viridis_web/utilities/constants.dart';

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
    return MediaQuery.of(context).size.width *
        (Responsive.isDesktop(context) ? 0.45 : 0.85);
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
          () => launchCustomURL(
              "https://medium.com/@viridisnetwork/ais-double-edged-sword-viridis-network-s-blueprint-for-a-carbon-neutral-future-bd094316de51"),
          "assets/images/blogs_intro-1.png",
          "May 21, 2014",
          "AI’s Double-Edged Sword: Viridis Network’s Blueprint for a Carbon-Neutral Future",
          "The rapidly increasing influence of Artificial Intelligence (AI) is undeniable; OpenAI’s ChatGPT, was launched in November 2022 and now boasts over 180 million users. AI is also transforming a number of industries, from healthcare to finance as the public and private sectors seek to improve the efficiency of their day-to-day operations."),
      _blogIntro(
          () => launchCustomURL(
              "https://medium.com/@viridisnetwork/the-viridis-vision-setting-new-standards-in-carbon-market-trust-and-transparency-803c11167f23"),
          "assets/images/blogs_intro-2.png",
          "May 11, 2024",
          "The Viridis Vision: Setting New Standards in Carbon Market Trust and Transparency",
          "Building upon the discussion from our previous article on the pivotal role of carbon credits in combatting climate change, we now turn our attention to the pressing challenges that undermine their effectiveness and credibility."),
      _blogIntro(
          () => launchCustomURL(
              "https://medium.com/@viridisnetwork/unpacking-carbon-credits-the-role-of-verification-and-validation-bodies-c47a9b38ab7d"),
          "assets/images/blogs_intro-3.png",
          "May 08, 2024",
          "Unpacking Carbon Credits: The Role of Verification and Validation Bodies",
          "In the global effort to combat climate change, carbon credits have emerged as valuable tools for reducing greenhouse gas emissions. Essentially, carbon credits represent a quantifiable reduction in carbon dioxide (CO2) emissions achieved by specific projects or activities. These credits are awarded to initiatives that reduce, avoid, or remove CO2 from the atmosphere, such as renewable energy projects, reforestation efforts, or energy efficiency upgrades"),
      _blogIntro(
          () => launchCustomURL(
              "https://medium.com/@viridisnetwork/transforming-business-with-vrd-the-carbon-offsetting-advantage-95bbedc47723"),
          "assets/images/blogs_intro-4.png",
          "April 28, 2024",
          "Transforming Business with VRD: The Carbon Offsetting Advantage",
          "In an era marked by escalating climate concerns, corporations face mounting pressure for environmental accountability. California’s recent move, barring new property insurance due to climate risks, underscores the urgency of confronting climate change’s tangible impacts. Moreover, the stark reality that Less Economically Developed Countries (LEDCs) endure 69% of climate-related fatalities while contributing minimally to the crisis highlights profound inequities exacerbated by climate change."),
      _blogIntro(
          () => launchCustomURL(
              "https://medium.com/@viridisnetwork/lessons-from-unsuccessful-blockchain-carbon-credits-initiatives-insights-for-vrd-6400f7c19c41"),
          "assets/images/blogs_intro-5.png",
          "April 21, 2024",
          "Lessons from Unsuccessful Blockchain Carbon Credits Initiatives: Insights for VRD",
          "Carbon credits and blockchain technology have recently converged to revolutionize the way we track, trade, and account for carbon emissions, paving the path for a more sustainable and transparent future. By harnessing the decentralized and immutable nature of blockchain, various partnerships and alliances have bloomed between industry veterans and non-profit organizations to streamline carbon offset projects."),
      _blogIntro(
          () => launchCustomURL(
              "https://medium.com/@viridisnetwork/blackrock-embraces-rwa-tokenization-a-game-changer-for-viridis-network-8346c86af03b"),
          "assets/images/blogs_intro-6.png",
          "April 05, 2024",
          "BlackRock Embraces RWA Tokenization: A Game-Changer for Viridis Network?",
          "Recently, BlackRock announced its movement into Real World Asset (RWA) tokens, signalling a possible significant growth in the market given its image as a major institutional player."),
      _blogIntro(
          () => launchCustomURL(
              "https://medium.com/@viridisnetwork/gigantix-wallet-partners-with-viridis-network-to-enhance-wallet-operations-with-sustainability-c7295200ffc1"),
          "assets/images/blogs_intro-7.png",
          "May 29, 2024",
          "Gigantix Wallet Partners with Viridis Network to Enhance Wallet Operations with Sustainability Initiatives",
          "Gigantix Wallet, a cryptocurrency wallet that employs a unique storing method for digital assets securely, recently formed an alliance with Viridis Network (VRD) to achieve carbon neutrality. The partnership will facilitate the introduction of green practices into the crypto sphere."),
      _blogIntro(
          () => launchCustomURL(
              "https://medium.com/@viridisnetwork/carbon-credits-and-cfa-catalysts-for-netzero-or-barriers-to-progress-5676b5bd8492"),
          "assets/images/blogs_intro-8.png",
          "May 22, 2024",
          "Carbon Credits and CFA: Catalysts for ‘NetZero’ or Barriers to Progress?",
          "Public awareness for the critical need to achieve the ‘NetZero’ target by 2050 has reached an all-time high, especially with the recent earth temperature rise of 0.06℃ per decade since 1850 [1]."),
    ];
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
        Text("Our Medium",
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
      SizedBox(
          height: Responsive.isDesktop(context) ? 0.65.sh : 0.95.sh,
          child: GridView.builder(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              itemCount: _blogsList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: _getItemExtent(),
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 15,
                  crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return _blogsList[index];
              })),
      const SizedBox(height: 40),
      Responsive(
          mobile: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
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

  _blogIntro(
      Function() onTap, String path, String date, String title, String data) {
    return InkWell(
        onTap: onTap,
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
      padding: const EdgeInsets.all(5),
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
                      textColor: const Color(0xff07BA9B))),
              const SizedBox(height: 10),
              Text(title,
                  style: Responsive.getTextStyle(context,
                      weight: FontWeight.w600,
                      dSize: 18,
                      mSize: 16,
                      textColor: Colors.white)),
            ]),
            Text("${data.substring(0, 110)}...",
                style: Responsive.getTextStyle(context,
                    weight: FontWeight.w400,
                    dSize: 16,
                    mSize: 14,
                    textColor: const Color(0xffAEAEAE)))
          ]),
    );
  }

  _scrollButtons() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      _scrollButton(Colors.black, const Color(0xff5A5A5A), Icons.chevron_left, () {
        setState(() {
          _controller.animateTo(_controller.offset - _getItemExtent(),
              duration: const Duration(milliseconds: 150),
              curve: Curves.linear);
        });
      }),
      const SizedBox(width: 5),
      _scrollButton(Colors.black, const Color(0xff07BA9B), Icons.chevron_right, () {
        _controller.animateTo(_controller.offset + _getItemExtent(),
            duration: const Duration(milliseconds: 150), curve: Curves.linear);
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
