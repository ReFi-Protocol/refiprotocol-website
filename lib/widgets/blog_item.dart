import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../utilities/responsive.dart';

class BlogItem extends StatefulWidget {
  final Function() onTap;
  final String path;
  final String date;
  final String title;
  final String data;
  const BlogItem(
      {super.key,
      required this.onTap,
      required this.path,
      required this.date,
      required this.title,
      required this.data});

  @override
  State<BlogItem> createState() => _BlogItemState();
}

class _BlogItemState extends State<BlogItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.onTap,
        child: Responsive(
            mobile: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Image.network(
                    widget.path,
                    fit: BoxFit.cover,
                  )),
                  const SizedBox(height: 15),
                  _blogIntroData(widget.date, widget.title, widget.data)
                ]),
            desktop:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Expanded(
                  child: Image.network(
                widget.path,
                fit: BoxFit.cover,
              )),
              const SizedBox(width: 15),
              Expanded(
                  child: _blogIntroData(widget.date, widget.title, widget.data))
            ])));
  }

  _blogIntroData(String date, String title, String data) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(formatDate(date),
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
            const SizedBox(height: 5),
            Text("${data.substring(0, 100)}...",
                maxLines: 3,
                style: Responsive.getTextStyle(context,
                    weight: FontWeight.w400,
                    dSize: 16,
                    mSize: 14,
                    textColor: const Color(0xffAEAEAE)))
          ]),
    );
  }

  String formatDate(String inputDate) {
    // Parse the input string into a DateTime object
    DateTime parsedDate = DateTime.parse(inputDate);

    // Format the DateTime object into the desired format
    String formattedDate = DateFormat('d MMMM yyyy').format(parsedDate);

    return formattedDate;
  }
}
