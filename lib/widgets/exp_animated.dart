import 'package:flutter/material.dart';

class ExpAnimated extends StatefulWidget {
  @override
  _ExpAnimatedState createState() => _ExpAnimatedState();
}

class _ExpAnimatedState extends State<ExpAnimated> {
  Color _color = Color.fromRGBO(245, 220, 216, 1.0);
  double _height = 100;
  double _width = 200;

  void _animate() {
    setState(() {
      if (_height > 100) {
        _height = 100;
        _color = Color.fromRGBO(245, 220, 216, 1.0);
      } else {
        _height = 200;
        _color = Color.fromRGBO(100, 220, 216, 1.0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _animate,
      child: AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: _color,
        ),
        duration: Duration(seconds: 1),
        // color: _color,
        height: _height,
        width: _width,
      ),
    );
    ;
  }
}
