import 'package:flutter/material.dart';

class AnimatedCard extends StatefulWidget {
  @override
  _AnimatedCardState createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard> {
  Color _color = Color.fromRGBO(245, 220, 216, 1.0);
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: Center(
          child: AnimatedContainer(
            width: selected ? 400.0 : 400.0,
            height: selected ? 100.0 : 300.0,
            color: selected ? Colors.red : Colors.blue,
            alignment:
                selected ? Alignment.bottomLeft : AlignmentDirectional.topStart,
            duration: Duration(seconds: 1),
            // curve: Curves.elasticInOut,
            curve: Curves.fastOutSlowIn,
            // curve: Curves.slowMiddle,
            padding: EdgeInsets.all(20),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: '\n\n',
                  ),
                  TextSpan(
                    text: 'About \n\n',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                      
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
      ),
    );
  }
}
