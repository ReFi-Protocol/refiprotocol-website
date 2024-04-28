import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class InnovationFrame extends StatefulWidget {
  const InnovationFrame({super.key});

  @override
  State<InnovationFrame> createState() => _InnovationFrameState();
}

class _InnovationFrameState extends State<InnovationFrame> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      height: 952.h,
      width: 1.sw,
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
          height: 70.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _detailCard(
                "Sustainable Project Selection",
                "Reforestation and renewable energy initiatives are the foundation of our carbon offsetting supply chain",
                "images/detail_1.png",
                Color(0xff047840)),
            _detailCard(
                "WCRN Issuance",
                "We issue tokenized carbon credits in the form of our fraction-able wCRBN NFTs",
                "images/detail_2.png",
                Color(0xff1C1C1C)),
            _detailCard(
                "Blockchain Technology",
                "The tamper-resistant nature ensures that your digital asset is verifiable, unique, and safeguarded against any risk of double spending.",
                "images/detail_3.png",
                Color(0xffF5F5F5),
                darkFont: true),
          ],
        )
      ]),
    );
  }

  _detailCard(String title, String details, String path, Color bgColor,
      {bool darkFont = false}) {
    return Container(
      width: 350.w,
      height: 616.h,
      padding: EdgeInsets.symmetric(vertical: 35.h, horizontal: 25.w),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(30)),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              textAlign: TextAlign.left,
              style: GoogleFonts.inter(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: darkFont ? Colors.black : Colors.white),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              details,
              textAlign: TextAlign.left,
              style: GoogleFonts.inter(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: darkFont ? Colors.black : Colors.white),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
                child: Center(
              child: Image.asset(path),
            ))
          ]),
    );
  }
}
