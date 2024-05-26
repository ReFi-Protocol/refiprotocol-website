import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CTAButton extends StatefulWidget {
  const CTAButton({super.key, this.child, this.filled = false, this.onTap});
  final Widget? child;
  final bool filled;
  final Function()? onTap;

  @override
  State<CTAButton> createState() => _CTAButtonState();
}

class _CTAButtonState extends State<CTAButton> {
  bool _useFilled = false;

  @override
  void initState() {
    _useFilled = widget.filled;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: widget.onTap,
      onHover: (value) => setState(() => _useFilled = !_useFilled),
      style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 18),
          // overlayColor: MaterialStatePropertyAll(Colors.green.withOpacity(0.1)),
          side: BorderSide(color: Colors.white),
          backgroundColor: _useFilled ? Colors.white : Colors.transparent,
          foregroundColor: _useFilled ? Colors.black : Colors.white,
          textStyle: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          )),
      child: widget.child,
    );
  }
}
