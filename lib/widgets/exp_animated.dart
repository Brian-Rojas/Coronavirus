import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class ExpAnimated extends StatefulWidget {
  final String cardTitle;
  final String discription;
  final double textHeight;
  final Color color;

  ExpAnimated({
    this.cardTitle = 'Title',
    this.discription = '\n\ndiscription',
    this.textHeight = 200,
    this.color = Colors.red,
  });

  @override
  _ExpAnimatedState createState() => _ExpAnimatedState();
}

class _ExpAnimatedState extends State<ExpAnimated> {
  MediaQueryData _mediaQueryData;
  Color _color = Colors.red;
  double _height = 100;

  @override
  Widget build(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_height > 100) {
            _height = 100;
            _color = widget.color;
          } else {
            _height = widget.textHeight;
            _color = widget.color;
          }
        });
      },
      child: AnimatedContainer(
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: widget.color,
        ),
        duration: Duration(milliseconds: 1000),
        curve: Curves.elasticInOut,
        height: _height,
        width: _mediaQueryData.size.width,
        child: Container(
          padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 10),
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: widget.cardTitle,
                  style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                TextSpan(
                  text: widget.discription,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
