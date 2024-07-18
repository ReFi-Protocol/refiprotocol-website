import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMenuItem extends StatefulWidget {
  const CustomMenuItem(
      {super.key, required this.title, required this.selected, this.onTap});
  final String title;
  final bool selected;
  final Function()? onTap;

  @override
  State<CustomMenuItem> createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends State<CustomMenuItem> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        child: TextButton(
          onPressed: widget.onTap ?? () {},
          child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: _hover || widget.selected
                  ? GoogleFonts.inter(
                      decoration: TextDecoration.overline,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationThickness: 2,
                      decorationColor: Colors.pink,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white)
                  : GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white),
              child: Text(
                widget.title,
              )),
        ));
  }
}
