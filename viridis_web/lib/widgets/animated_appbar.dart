import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_appbar.dart';

class AnimatedAppbar extends StatefulWidget {
  const AnimatedAppbar(
      {super.key, required this.controller, required this.route});
  final ScrollController controller;
  final String route;

  @override
  State<AnimatedAppbar> createState() => _AnimatedAppbarState();
}

class _AnimatedAppbarState extends State<AnimatedAppbar> {
  static final double _containerHeight = 0.2.sh;
  double _fromTop = -_containerHeight;
  bool _allowReverse = true, _allowForward = true;
  double _prevOffset = 0.0;
  double _prevForwardOffset = -_containerHeight;
  double _prevReverseOffset = 0.0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_listener);
  }

  void _listener() {
    double offset = widget.controller.offset;
    var direction = widget.controller.position.userScrollDirection;

    if (direction == ScrollDirection.reverse) {
      _allowForward = true;

      if (_allowReverse) {
        _allowReverse = false;
        _prevOffset = offset;
        _prevForwardOffset = _fromTop;
      }

      var difference = offset - _prevOffset;
      _fromTop = _prevForwardOffset + difference;
      if (_fromTop > 0) _fromTop = 0;
    } else if (direction == ScrollDirection.forward) {
      _allowReverse = true;

      if (_allowForward) {
        _allowForward = false;
        _prevReverseOffset = _fromTop;
      }

      var difference = offset - _prevOffset;

      if (offset > 100.0) {
        _prevOffset = offset;
      }

      if (offset < 100.0) {
        _fromTop = _prevReverseOffset + difference;
        if (_fromTop < -_containerHeight) _fromTop = -_containerHeight;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _fromTop,
      left: 0,
      right: 0,
      child: CustomAppBar(
        bgColor: Colors.black,
        page: widget.route,
      ),
    );
  }
}
