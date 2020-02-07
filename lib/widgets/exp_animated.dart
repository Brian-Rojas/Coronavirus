import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  double _height = 60;

  @override
  Widget build(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: new BoxDecoration(
        color: Colors.white,
        // shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(12.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4.0, // has the effect of softening the shadow
            spreadRadius: 2.0, // has the effect of extending the shadow
            offset: Offset(
              1.0, // horizontal, move right 10
              1.0, // vertical, move down 10
            ),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (_height > 100) {
              _height = 60;
              _color = widget.color;
            } else {
              _height = widget.textHeight;
              _color = widget.color;
            }
          });
        },
        child: AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: widget.color,
          ),
          duration: Duration(milliseconds: 1000),
          curve: Curves.elasticInOut,
          // curve: Curves.decelerate,
          height: _height,
          width: _mediaQueryData.size.width,
          child: Container(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: widget.cardTitle,
                    style: GoogleFonts.montserrat(
                      fontSize: 23,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  TextSpan(
                    text: widget.discription,
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
