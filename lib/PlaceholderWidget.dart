import 'package:flutter/material.dart';

import './widgets/status_card.dart';

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StatusCard(),
      color: color,
    );
  }
}
