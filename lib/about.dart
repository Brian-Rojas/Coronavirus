import 'package:coronavirus_app/widgets/image_slider.dart';
import 'package:flutter/material.dart';
// import 'widgets/animated_card.dart';
import 'widgets/exp_animated.dart';
// import 'widgets/expandable.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              ImageSlider(),
              ExpAnimated(),
              // AnimatedCard(),
              // ExpandableCard(),
              // ExpandableCard(
              //   title: "Transmission",
              //   color: Color.fromRGBO(245, 220, 216, 1.0),
              // ),
              // ExpandableCard(
              //   title: "Symptoms",
              //   color: Color.fromRGBO(228, 209, 195, 1.0),
              // ),
              // ExpandableCard(
              //   title: "Prevention",
              //   color: Colors.amber,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
