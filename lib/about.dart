import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:carousel_slider/carousel_slider.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'About',
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 45,
            ),
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              CarouselSlider(
                height: 175,
                enlargeCenterPage: true,
                // autoPlay: false,
                // autoPlayInterval: Duration(seconds: 3),
                // autoPlayAnimationDuration: Duration(milliseconds: 800),
                // autoPlayCurve: Curves.fastOutSlowIn,
                // enableInfiniteScroll: true,
                // aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                pauseAutoPlayOnTouch: Duration(seconds: 6),
                items: ['1.jpg', '2.jpg'].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          child: Image.asset(
                            'assets/images/$i',
                            fit: BoxFit.cover,
                          ),
                        ),
                        // child: Text(
                        //   'text $i',
                        //   style: TextStyle(fontSize: 16.0),
                        // ),
                      );
                    },
                  );
                }).toList(),
              ),
              Container(
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
                      color: Color.fromRGBO(185, 209, 195, 1.0),
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
                        'Info',
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                  ),
                  collapsed: Container(
                    decoration: new BoxDecoration(
                      color: Color.fromRGBO(185, 209, 195, 1.0),
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
                      color: Color.fromRGBO(185, 209, 195, 1.0),
                      shape: BoxShape.rectangle,
                      borderRadius: new BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        '2019 Novel Coronavirus (2019-nCoV) is a virus (more specifically, a coronavirus) identified as the cause of an outbreak of respiratory illness first detected in Wuhan, China. Early on, many of the patients in the outbreak in Wuhan, China reportedly had some link to a large seafood and animal market, suggesting animal-to-person spread. However, a growing number of patients reportedly have not had exposure to animal markets, indicating person-to-person spread is occurring. At this time, it’s unclear how easily or sustainably this virus is spreading between people.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
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
                      color: Color.fromRGBO(245, 220, 216, 1.0),
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
                        'Transmission',
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                  ),
                  collapsed: Container(
                    decoration: new BoxDecoration(
                      color: Color.fromRGBO(245, 220, 216, 1.0),
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
                      color: Color.fromRGBO(245, 220, 216, 1.0),
                      shape: BoxShape.rectangle,
                      borderRadius: new BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        '2019 Novel Coronavirus (2019-nCoV) is a virus (more specifically, a coronavirus) identified as the cause of an outbreak of respiratory illness first detected in Wuhan, China. Early on, many of the patients in the outbreak in Wuhan, China reportedly had some link to a large seafood and animal market, suggesting animal-to-person spread. However, a growing number of patients reportedly have not had exposure to animal markets, indicating person-to-person spread is occurring. At this time, it’s unclear how easily or sustainably this virus is spreading between people.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
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
                      color: Color.fromRGBO(228, 209, 195, 1.0),
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
                        'Symptoms',
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                  ),
                  collapsed: Container(
                    decoration: new BoxDecoration(
                      color: Color.fromRGBO(228, 209, 195, 1.0),
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
                      color: Color.fromRGBO(228, 209, 195, 1.0),
                      shape: BoxShape.rectangle,
                      borderRadius: new BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        '2019 Novel Coronavirus (2019-nCoV) is a virus (more specifically, a coronavirus) identified as the cause of an outbreak of respiratory illness first detected in Wuhan, China. Early on, many of the patients in the outbreak in Wuhan, China reportedly had some link to a large seafood and animal market, suggesting animal-to-person spread. However, a growing number of patients reportedly have not had exposure to animal markets, indicating person-to-person spread is occurring. At this time, it’s unclear how easily or sustainably this virus is spreading between people.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
