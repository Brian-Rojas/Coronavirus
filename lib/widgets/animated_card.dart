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

            child: CustomScrollView(
              slivers: <Widget>[
                const SliverAppBar(
                  pinned: true,
                  expandedHeight: 250.0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text('About'),
                  ),
                ),
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200.0,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 4.0,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                        alignment: Alignment.center,
                        color: Colors.teal[100 * (index % 9)],
                        child: Text('Grid Item $index'),
                      );
                    },
                    childCount: 20,
                  ),
                ),
                SliverFixedExtentList(
                  itemExtent: 50.0,
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                        alignment: Alignment.center,
                        color: Colors.lightBlue[100 * (index % 9)],
                        child: Text('List Item $index'),
                      );
                    },
                  ),
                ),
              ],
            ),
            // child: RichText(
            //   text: TextSpan(
            //     style: DefaultTextStyle.of(context).style,
            //     children: <TextSpan>[
            //       TextSpan(
            //         text: '\n\n',
            //       ),
            //       TextSpan(
            //         text: 'About \n\n',
            //         style: TextStyle(
            //           fontSize: 24.0,
            //           color: Theme.of(context).accentColor,
            //           fontWeight: FontWeight.bold,

            //         ),
            //       ),
            //       TextSpan(
            //         text:
            //             'The 2019 Novel Coronavirus (2019-nCoV) is a virus (more specifically, a coronavirus) identified as the cause of an outbreak of respiratory illness first detected in Wuhan, China. Early on, many of the patients in the outbreak in Wuhan, China reportedly had some link to a large seafood and animal market, suggesting animal-to-person spread. However, a growing number of patients reportedly have not had exposure to animal markets, indicating person-to-person spread is occurring. At this time, it’s unclear how easily or sustainably this virus is spreading between people.',
            //         style: TextStyle(
            //           fontSize: 14.0,
            //           color: Theme.of(context).accentColor,
            //           // fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}
