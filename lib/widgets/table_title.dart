import 'package:flutter/material.dart';

class TableTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color lblColor = Theme.of(context).accentColor;
    final Color lblBGColor = Colors.transparent;

    return Container(
      color: Colors.transparent,
      // color: Colors.blue,

      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 20),
      // padding: EdgeInsets.only(left: 15, right: 15),
      height: 50,
      child: Center(
        child: Container(
          // decoration: new BoxDecoration(
          //   color: Colors.transparent,
          //   shape: BoxShape.rectangle,
          //   borderRadius: new BorderRadius.circular(12),
          //   boxShadow: <BoxShadow>[
          //     new BoxShadow(
          //       color: Colors.black12,
          //       blurRadius: 10.0,
          //       offset: new Offset(0.0, 10.0),
          //     ),
          //   ],
          // ),
          child: Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  color: lblBGColor,
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Center(
                    child: Text(
                      'COUNTRY',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: lblColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: lblBGColor,
                  width: MediaQuery.of(context).size.width / 3 - 30,
                  child: Center(
                    child: Text(
                      'CASES',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: lblColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: lblBGColor,
                  width: MediaQuery.of(context).size.width / 3 - 30,
                  child: Center(
                    child: Text(
                      'DEATHS',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: lblColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
