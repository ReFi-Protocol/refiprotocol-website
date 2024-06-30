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
  Duration duration = Duration(milliseconds: 500);
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        padding: EdgeInsets.all(20),
        duration: Duration(milliseconds: 100),
        height: 450,
        width: 300,
        decoration: BoxDecoration(
            color: _selected ? widget.selectedColor : Colors.black,
            border: Border.all(
                color: _selected ? widget.selectedColor : Color(0xff868686)),
            borderRadius: BorderRadius.circular(30)),
        child: Stack(
          children: [
            AnimatedOpacity(
              opacity: _selected ? 1 : 0,
              duration: duration,
              curve: Curves.easeIn,
              child: Padding(
                padding: EdgeInsets.only(top: 80),
                child: Text(
                  widget.detail,
                  style: TextStyle(color: widget.selectedTextColor),
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: !_selected ? 1 : 0,
              curve: Curves.easeOut,
              duration: !_selected ? duration : Duration(milliseconds: 10),
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
      duration: Duration(milliseconds: 300),
      alignment: _selected ? Alignment.topLeft : Alignment.bottomLeft,
      child: Padding(
        padding: EdgeInsets.only(bottom: 75),
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
    return CircleAvatar(
        backgroundColor: !_selected ? widget.selectedColor : Colors.black,
        child: IconButton(
          color: _selected ? widget.selectedColor : Colors.black,
          icon: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              transitionBuilder: (child, anim) => RotationTransition(
                    turns: child.key == const ValueKey('icon1')
                        ? Tween<double>(begin: 1, end: 1.12).animate(anim)
                        : Tween<double>(begin: 1.12, end: 1).animate(anim),
                    child: FadeTransition(opacity: anim, child: child),
                  ),
              child: _selected
                  ? const Icon(Icons.add, key: ValueKey('icon1'))
                  : const Icon(
                      Icons.add,
                      key: ValueKey('icon2'),
                    )),
          onPressed: () {
            setState(() {
              _selected = !_selected;
            });
          },
        ));
  }
}
