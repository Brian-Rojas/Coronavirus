import 'package:flutter/material.dart';

import './widgets/status_card_tri.dart';

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      // child: Text("hi khush"),
      child: Column(
        children: <Widget>[
          StatusCardTri(),
        ],
      ),
      color: color,
    );
  }
}
