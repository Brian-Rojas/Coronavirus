import 'package:coronavirus_app/widgets/table_item.dart';
import 'package:coronavirus_app/widgets/table_title.dart';
import 'package:flutter/material.dart';

import 'widgets/status_card.dart';

class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Column(
        children: <Widget>[
          StatusCard(),
          TableTitle(),
          Container(
            color: Colors.transparent,
            alignment: Alignment.topCenter,
            height: MediaQuery.of(context).size.height - 283,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TableItem(),
                  TableItem(),
                  TableItem(),
                  TableItem(),
                  TableItem(),
                  TableItem(),
                  TableItem(),
                  TableItem(),
                  TableItem(),
                  TableItem(),
                  TableItem(),
                  TableItem(),
                  TableItem(),
                  TableItem(),
                  TableItem(),
                  TableItem(),
                  TableItem(),
                  TableItem(),
                  TableItem(),
                ],
              ),
            ),
          ),
        ],
      ),
      color: Colors.white,
    );
  }
}
