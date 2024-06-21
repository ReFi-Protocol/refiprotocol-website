import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class FadeInListItem extends StatefulWidget {
  final Widget child;

  FadeInListItem({required this.child});

  @override
  _FadeInListItemState createState() => _FadeInListItemState();
}

class _FadeInListItemState extends State<FadeInListItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<Offset> _slideAnimation;

  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.07), // Start slightly below
      end: Offset.zero, // End at the final position
    ).animate(_animation);
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('${widget.child.hashCode}'),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0 && !_isVisible) {
          _controller.forward();
          setState(() {
            _isVisible = true;
          });
        }
      },
      child: FadeTransition(
        opacity: _animation,
        child: SlideTransition(position: _slideAnimation, child: widget.child),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
