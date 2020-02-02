import 'package:flutter/material.dart';

class TableItem extends StatelessWidget {
  final Color lblBGColor = Colors.white;
  final Color lblColor = Colors.grey;
  final bool shadowEnabled;
  final String country;
  final String cases;
  final String deaths;

  TableItem(
      {this.shadowEnabled = true,
      this.country = "China",
      this.cases = "12,789",
      this.deaths = "233"});

  BoxShadow getShadow() {
    if (this.shadowEnabled) {
      return new BoxShadow(
        color: Colors.black12,
        blurRadius: 10.0,
        offset: new Offset(0.0, 10.0),
      );
    }
    return new BoxShadow();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 0),
      // padding: EdgeInsets.only(left: 15, right: 15),
      height: 50,
      child: Center(
        child: Container(
          decoration: new BoxDecoration(
            color: Colors.white,
            // shape: BoxShape.rectangle,
            // border: Border.all(
            //     width: 0, color: Colors.transparent, style: BorderStyle.none),
            // borderRadius: new BorderRadius.circular(12),
            boxShadow: <BoxShadow>[
              getShadow(),
            ],
          ),
          child: Container(
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 3 - 30,
                  color: lblBGColor,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Flag_of_the_People%27s_Republic_of_China.svg/45px-Flag_of_the_People%27s_Republic_of_China.svg.png',
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Text(
                          country,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3 - 30,
                  height: 20,
                  color: lblBGColor,
                  child: Center(
                    child: Text(
                      cases,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: lblColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3 - 30,
                  height: 20,
                  color: lblBGColor,
                  child: Center(
                    child: Text(
                      deaths,
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
