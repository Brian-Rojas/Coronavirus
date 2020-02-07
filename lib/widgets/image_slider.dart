import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final double height;
  final List<String> imgNames;
  final bool autoPlay;

  ImageSlider({
    this.height = 175,
    this.imgNames = const ['1.jpg', '2.jpg'],
    this.autoPlay = false,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      height: height,
      enlargeCenterPage: true,
      autoPlay: autoPlay,
      autoPlayInterval: Duration(seconds: 5),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      // enableInfiniteScroll: true,
      // aspectRatio: 16 / 9,
      viewportFraction: 0.8,
      pauseAutoPlayOnTouch: Duration(seconds: 6),
      items: imgNames.map((i) {
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
    );
  }
}