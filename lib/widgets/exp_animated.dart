import 'dart:ui';

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

  var info =
      'A novel coronavirus (nCoV) is a new strain of coronavirus that has not been previously identified in humans. The new, or “novel” coronavirus, now called 2019-nCoV, had not previously detected before the outbreak was reported in Wuhan, China in December 2019.';

  var transmission =
      'Person-to-person spread is thought to occur mainly via respiratory droplets produced when an infected person coughs or sneezes, similar to how influenza and other respiratory pathogens spread. These droplets can land in the mouths or noses of people who are nearby or possibly be inhaled into the lungs. It’s currently unclear if a person can get 2019-nCoV by touching a surface or object that has the virus on it and then touching their own mouth, nose, or possibly their eyes.';

  var symptoms = 'Common signs of infection include respiratory symptoms, fever, cough, shortness of breath and breathing difficulties. In more severe cases, infection can cause pneumonia, severe acute respiratory syndrome, kidney failure and even death.';

  var prevention = 'Standard recommendations to prevent infection spread include regular hand washing, covering mouth and nose when coughing and sneezing, thoroughly cooking meat and eggs. Avoid close contact with anyone showing symptoms of respiratory illness such as coughing and sneezing.';

  void _animate() {
    setState(() {
      if (_height > 100) {
        _height = 100;
        _color = Color.fromRGBO(245, 220, 216, 1.0);
      } else {
        _height = 250;
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
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(text: '\n\n'),
                TextSpan(
                  text: 'Info \n\n',
                  style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).accentColor,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:info,
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
    );
  }
}
