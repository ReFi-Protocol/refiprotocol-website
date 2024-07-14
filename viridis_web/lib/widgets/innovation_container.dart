import 'package:flutter/material.dart';

class InnovationContainer extends StatefulWidget {
  const InnovationContainer(
      {super.key,
      required this.selectedColor,
      required this.image_path,
      required this.title,
      required this.detail,
      this.selectedTextColor = Colors.black});
  final Color selectedColor;
  final Color selectedTextColor;
  final String image_path;
  final String title;
  final String detail;

  @override
  State<InnovationContainer> createState() => _InnovationContainerState();
}

class _InnovationContainerState extends State<InnovationContainer> {
  Duration duration = const Duration(milliseconds: 500);
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        padding: const EdgeInsets.all(20),
        duration: const Duration(milliseconds: 100),
        height: 480,
        width: 300,
        decoration: BoxDecoration(
            color: _selected ? widget.selectedColor : Colors.black,
            border: Border.all(
                color:
                    _selected ? widget.selectedColor : const Color(0xff868686)),
            borderRadius: BorderRadius.circular(30)),
        child: Stack(
          children: [
            AnimatedOpacity(
              opacity: _selected ? 1 : 0,
              duration: duration,
              curve: Curves.easeIn,
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Text(
                  widget.detail,
                  style: TextStyle(color: widget.selectedTextColor),
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: !_selected ? 1 : 0,
              curve: Curves.easeOut,
              duration:
                  !_selected ? duration : const Duration(milliseconds: 10),
              child: Image.asset(widget.image_path),
            ),
            _animatedTitle(),
            Align(
              alignment: Alignment.bottomRight,
              child: _animatedIconButton(),
            )
          ],
        ));
  }

  _animatedTitle() {
    return AnimatedAlign(
      duration: const Duration(milliseconds: 300),
      alignment: _selected ? Alignment.topLeft : Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 75),
        child: Text(
          widget.title,
          textAlign: TextAlign.left,
          style: TextStyle(
              color: _selected ? widget.selectedTextColor : Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  _animatedIconButton() {
    return InkWell(
        onTap: () {
          setState(() {
            _selected = !_selected;
          });
        },
        child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: !_selected
                  ? widget.selectedColor
                  : Colors.black, // border color
              shape: BoxShape.circle,
            ),
            child: Center(
              child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, anim) => RotationTransition(
                        turns: child.key == const ValueKey('icon1')
                            ? Tween<double>(begin: 1, end: 1.12).animate(anim)
                            : Tween<double>(begin: 1.12, end: 1).animate(anim),
                        child: FadeTransition(opacity: anim, child: child),
                      ),
                  child: _selected
                      ? Icon(
                          Icons.add,
                          size: 25,
                          key: ValueKey('icon1'),
                          color:
                              _selected ? widget.selectedColor : Colors.black,
                        )
                      : Icon(
                          Icons.add,
                          size: 25,
                          key: ValueKey('icon2'),
                          color:
                              _selected ? widget.selectedColor : Colors.black,
                        )),
            )));
  }
}
