import 'package:coronavirus_app/widgets/image_slider.dart';
import 'package:flutter/material.dart';
import 'widgets/exp_animated.dart';

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
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          color: Colors.transparent,
          child: Column(
            children: <Widget>[
              ImageSlider(),
              // ExpAnimated(),
              ExpAnimated(
                cardTitle: 'Overview\n\n',
                textHeight: 250,
                discription: info,
                color: Color.fromRGBO(283, 70, 102, 0.25),
              ),
              ExpAnimated(
                cardTitle: 'Transmission\n\n',
                textHeight: 300,
                discription: transmission,
                color: Color.fromRGBO(205, 118, 114, 0.25),
              ),
              ExpAnimated(
                cardTitle: 'Symptoms\n\n',
                textHeight: 250,
                discription: symptoms,
                color: Color.fromRGBO(238, 180, 98, 0.25),
              ),
              ExpAnimated(
                cardTitle: 'Prevention\n\n',
                textHeight: 250,
                discription: prevention,
                color: Color.fromRGBO(19, 128, 134, 0.25),
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
                                // color: Color.fromRGBO(283, 70, 102, 0.15),
                                 color: Colors.transparent,
                                height: 200.0,
                                width: 360.0,
                                child: ListView(
                                  padding: EdgeInsets.all(20),
                                  children: <Widget>[
                                    Center(
                                      child: Text(
                                        "App Info\n",
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                    Text(
                                      'The data is updated every hour...',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
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
                        // color: Color.fromARGB(283, 70, 102, 0.75),
                      ),
                      label: Text(
                        'Info',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color.fromRGBO(283, 70, 102, 0.75),
                        ),
                      ),
                    ),
                    // FlatButton.icon(
                    //   onPressed: () {},
                    //   icon: Icon(Icons.share),
                    //   label: Text(
                    //     'Share',
                    //     style: Theme.of(context).textTheme.title,
                    //   ),
                    // ),
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
