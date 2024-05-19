import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CTAButton extends StatefulWidget {
  CTAButton({super.key, this.child, this.filled = false});
  final Widget? child;
  bool filled;

  @override
  State<CTAButton> createState() => _CTAButtonState();
}

class _CTAButtonState extends State<CTAButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        debugPrint('Received click');
      },
      style: ButtonStyle(
        padding: const MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 25, vertical: 18)),
        overlayColor: MaterialStatePropertyAll(Colors.green.withOpacity(0.1)),
        side: const MaterialStatePropertyAll(BorderSide(color: Colors.white)),
        backgroundColor:
            widget.filled ? const MaterialStatePropertyAll(Colors.white) : null,
      ),
      child: widget.child,
    );
  }
}
