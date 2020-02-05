import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class About extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return Scaffold (
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Colors.blue,
        child: ExpandablePanel(
          header: Text('Hello'),
          collapsed: Text('Testing', softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis,),
          expanded: Text('article body blah blah blah', softWrap: true, ),
        ),
      ),
    );
  }
}