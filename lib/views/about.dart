import 'package:coronavirus_app/widgets/image_slider.dart';
import 'package:flutter/material.dart';
import '../widgets/exp_animated.dart';

class About extends StatelessWidget {
  final String info =
      'A novel coronavirus (nCoV) is a new strain of coronavirus that has not been previously identified in humans. The new, or “novel” coronavirus, now called 2019-nCoV, had not previously detected before the outbreak was reported in Wuhan, China in December 2019.';

  final String transmission =
      'Person-to-person spread is thought to occur mainly via respiratory droplets produced when an infected person coughs or sneezes, similar to how influenza and other respiratory pathogens spread. These droplets can land in the mouths or noses of people who are nearby or possibly be inhaled into the lungs. It’s currently unclear if a person can get 2019-nCoV by touching a surface or object that has the virus on it and then touching their own mouth, nose, or possibly their eyes.';

  final String symptoms =
      'Common signs of infection include respiratory symptoms, fever, cough, shortness of breath and breathing difficulties. In more severe cases, infection can cause pneumonia, severe acute respiratory syndrome, kidney failure and even death. ';

  final String prevention =
      'Standard recommendations to prevent infection spread include regular hand washing, covering mouth and nose when coughing and sneezing, thoroughly cooking meat and eggs. Avoid close contact with anyone showing symptoms of respiratory illness such as coughing and sneezing.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            top: 20,
          ),
          child: Text(
            'About',
            style: Theme.of(context).accentTextTheme.headline,
            textScaleFactor: 1.0,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20),
          color: Colors.transparent,
          child: Column(
            children: <Widget>[
              ImageSlider(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ExpAnimated(
                  cardTitle: 'Overview\n\n',
                  textHeight: 250,
                  discription: info,
                  color: Color.fromRGBO(283, 70, 102, 0.25),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ExpAnimated(
                  cardTitle: 'Transmission\n\n',
                  textHeight: 300,
                  discription: transmission,
                  color: Color.fromRGBO(205, 118, 114, 0.25),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ExpAnimated(
                  cardTitle: 'Symptoms\n\n',
                  textHeight: 250,
                  discription: symptoms,
                  color: Color.fromRGBO(238, 180, 98, 0.25),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ExpAnimated(
                  cardTitle: 'Prevention\n\n',
                  textHeight: 250,
                  discription: prevention,
                  color: Color.fromRGBO(19, 128, 134, 0.25),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton.icon(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Container(
                                color: Colors.transparent,
                                height: 150.0,
                                child: ListView(
                                  padding: EdgeInsets.all(20),
                                  children: <Widget>[
                                    Text(
                                      "Info",
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .title,
                                      textScaleFactor: 1.0,
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 0, vertical: 10),
                                      child: Divider(
                                        height: 1,
                                      ),
                                    ),
                                    Text(
                                      'Updated hourly\nData Source: Wikipedia',
                                      style: Theme.of(context)
                                          .accentTextTheme
                                          .display3,
                                      textScaleFactor: 1.0,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      icon: Icon(
                        Icons.info,
                        color: Theme.of(context).accentColor,
                      ),
                      label: Text(
                        'Info',
                        style: Theme.of(context).accentTextTheme.title,
                        textScaleFactor: 1.0,
                      ),
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
