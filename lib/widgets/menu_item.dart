import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItem extends StatefulWidget {
  const MenuItem({super.key, this.title, this.selected, this.onPress});
  final String? title;
  final bool? selected;
  final Function()? onPress;
  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool _onHover = false;
  bool _isSelected = false;

  @override
  void initState() {
    _isSelected = widget.selected ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onHover: (value) => setState(() {
          _onHover = value;
        }),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: widget.onPress,
        child: Text(widget.title ?? "",
            style: GoogleFonts.inter(
                decoration:  _onHover
                    ? TextDecoration.overline
                    : TextDecoration.none,
                decorationColor: Colors.white,
                color: Colors.white,
                fontSize: 16,
                fontWeight:_isSelected?FontWeight.w700: FontWeight.w400)),
      ),
    );
  }
}
