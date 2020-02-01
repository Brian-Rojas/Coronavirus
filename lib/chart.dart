import 'package:coronavirus_app/widgets/table_item.dart';
import 'package:coronavirus_app/widgets/table_title.dart';
import 'package:flutter/material.dart';

import 'widgets/status_card.dart';

class Chart extends StatefulWidget {
  final Color color;
  Chart(this.color);

  @override
  _ChartState createState() => _ChartState(color);
}

class _ChartState extends State<Chart> {
  final Color color;

  _ChartState(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Column(
        children: <Widget>[
          StatusCard(),
          TableTitle(),
          TableItem(),
        ],
      ),
      color: color,
    );
  }
}
