import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ExpandableCard extends StatelessWidget {
  final String title;
  final String body;
  final Color color;

  ExpandableCard({
    this.title = "Info",
    this.body =
        '2019 Novel Coronavirus (2019-nCoV) is a virus (more specifically, a coronavirus) identified as the cause of an outbreak of respiratory illness first detected in Wuhan, China. Early on, many of the patients in the outbreak in Wuhan, China reportedly had some link to a large seafood and animal market, suggesting animal-to-person spread. However, a growing number of patients reportedly have not had exposure to animal markets, indicating person-to-person spread is occurring. At this time, it’s unclear how easily or sustainably this virus is spreading between people.',
    this.color = const Color.fromRGBO(185, 209, 195, 1.0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ExpandablePanel(
        theme: ExpandableThemeData(
          hasIcon: false,
          tapHeaderToExpand: true,
          animationDuration: Duration(milliseconds: 10),
          // headerAlignment: ExpandablePanelHeaderAlignment.bottom,
        ),
        header: Container(
          alignment: Alignment.bottomLeft,
          margin: EdgeInsets.only(top: 10),
          decoration: new BoxDecoration(
            color: color,
            shape: BoxShape.rectangle,
            borderRadius: new BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          height: 100,
          child: Padding(
            padding: const EdgeInsets.only(top: 0, left: 20),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
        ),
        collapsed: Container(
          decoration: new BoxDecoration(
            color: color,
            shape: BoxShape.rectangle,
            borderRadius: new BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          height: 15,
        ),
        expanded: Container(
          height: 200,
          // color: Colors.red,
          decoration: new BoxDecoration(
            color: color,
            shape: BoxShape.rectangle,
            borderRadius: new BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              body,
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
