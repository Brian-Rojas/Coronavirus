import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final String cases;
  final String deaths;
  StatusCard({this.cases = "99999", this.deaths = "333"});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      height: 80,
      margin: EdgeInsets.only(top: 50),
      child: Center(
        child: Card(
          elevation: 15,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      cases,
                      style: TextStyle(
                          fontSize: 30, color: Theme.of(context).accentColor),
                    ),
                    Text(
                      'Cases',
                      style: TextStyle(
                          fontSize: 16, color: Theme.of(context).accentColor),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: VerticalDivider(
                  color: Theme.of(context).accentColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      deaths,
                      style: TextStyle(
                          fontSize: 30, color: Theme.of(context).primaryColor),
                    ),
                    Text(
                      'Deaths',
                      style: TextStyle(
                          fontSize: 16, color: Theme.of(context).accentColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
