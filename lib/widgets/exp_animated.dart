import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExpAnimated extends StatefulWidget {
  @override
  _ExpAnimatedState createState() => _ExpAnimatedState();
}

class _ExpAnimatedState extends State<ExpAnimated> {
  MediaQueryData _mediaQueryData;
  Color _color = Color.fromRGBO(245, 220, 216, 1.0);
  double _height = 100;

  void _animate() {
    setState(() {
      if (_height > 100) {
        _height = 100;
        _color = Color.fromRGBO(245, 220, 216, 1.0);
      } else {
        _height = 300;
        _color = Color.fromRGBO(245, 220, 216, 1.0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    return GestureDetector(
      onTap: _animate,
      child: AnimatedContainer(
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: _color,
        ),
        duration: Duration(milliseconds: 1000),
        curve: Curves.elasticInOut,
        // color: _color,
        height: _height,
        width: _mediaQueryData.size.width,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Container(
            child: Column(
              children: <Widget>[
                Text("Info"),
                Container(
                  child: SingleChildScrollView(
                    child: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          // TextSpan(text: '\n\n'),
                          // TextSpan(
                          //   text: 'About \n\n',
                          //   style: TextStyle(
                          //     fontSize: 18.0,
                          //     color: Theme.of(context).accentColor,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          TextSpan(
                            text:
                                'The 2019 Novel Coronavirus (2019-nCoV) is a virus (more specifically, a coronavirus) identified as the cause of an outbreak of respiratory illness first detected in Wuhan, China. Early on, many of the patients in the outbreak in Wuhan, China reportedly had some link to a large seafood and animal market, suggesting animal-to-person spread. However, a growing number of patients reportedly have not had exposure to animal markets, indicating person-to-person spread is occurring. At this time, it’s unclear how easily or sustainably this virus is spreading between people. \n\n',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Theme.of(context).accentColor,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                'The 2019 Novel Coronavirus (2019-nCoV) is a virus (more specifically, a coronavirus) identified as the cause of an outbreak of respiratory illness first detected in Wuhan, China. Early on, many of the patients in the outbreak in Wuhan, China reportedly had some link to a large seafood and animal market, suggesting animal-to-person spread. However, a growing number of patients reportedly have not had exposure to animal markets, indicating person-to-person spread is occurring. At this time, it’s unclear how easily or sustainably this virus is spreading between people.',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Theme.of(context).accentColor,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
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
