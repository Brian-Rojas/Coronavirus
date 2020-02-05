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
          // color: Colors.white,
          margin: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 8,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            // borderRadius: BorderRadius.circular(12.0),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            
            child: Container(
              height: 50,
              color: Colors.white,
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
      ),
    );
  }
}
