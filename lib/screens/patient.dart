import 'package:cov_bed/components/customCard.dart';
import 'package:cov_bed/components/smallCard.dart';
import 'package:cov_bed/model/patients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:cov_bed/utlis/constants.dart';

class PatientPage extends StatefulWidget {
  final Patient patient;
  PatientPage({this.patient});

  @override
  _PatientPageState createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
      
        title: Text("Patient Details"),
      ),
      body: SingleChildScrollView(
        primary: false,
        child: Container(
          height: screenHeight,
          width: screenWidth,
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(
              screenWidth * 0.12, 30, screenWidth * 0.12, 0),
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Patient Id is "+widget.patient.id,
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "Patient Name is "+widget.patient.name,
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        height: screenHeight * 0.25,
                        width: screenWidth * 0.35,
                        child: Card(
                          color: primaryColor,
                          margin: EdgeInsets.all(5.0),
                          shadowColor: Colors.grey,
                          elevation: 15.0,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new CircularPercentIndicator(
                                radius: 80,
                                lineWidth: 7.0,
                                animation: true,
                                percent: 0.7,
                                center: new SvgPicture.asset(
                                  "assets/icons/calorie.svg",
                                  color: Colors.white,
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Colors.white,
                                backgroundColor: Color(0xff777EA7),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(6),
                                child: Text(
                                  widget.patient.temp.toString(),
                                  style: TextStyle(
                                    fontFamily: 'Muli',
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Text(
                                "C",
                                style: TextStyle(
                                  fontFamily: 'Muli',
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: screenWidth * 0.03),
                      CustomCard(
                        iconSvg: "assets/icons/heartbeat.svg",
                        value: widget.patient.heartrate.toString(),
                        unit: "bpm",
                        height: screenHeight * 0.25,
                        width: screenWidth * 0.35,
                      ),
                      SizedBox(height: screenWidth * 0.03),
                      SmallCard(
                        iconSvg: "assets/icons/distance.svg",
                        unit: "kms",
                        value: widget.patient.lastValue.toString(),
                        height: screenHeight * 0.15,
                        width: screenWidth * 0.35,
                      )
                    ],
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  Column(
                    children: <Widget>[
                      SmallCard(
                        value: widget.patient.spo.toString(),
                        unit: "kcal",
                        iconSvg: "assets/icons/moon.svg",
                        height: screenHeight * 0.15,
                        width: screenWidth * 0.35,
                      ),
                      SizedBox(height: screenWidth * 0.03),
                      CustomCard(
                        iconSvg: "assets/icons/foot.svg",
                        value: 34.toString(),
                        unit: "steps",
                        height: screenHeight * 0.25,
                        width: screenWidth * 0.35,
                      ),
                      SizedBox(height: screenWidth * 0.03),
                      CustomCard(
                        iconSvg: "assets/icons/stairs.svg",
                        unit: "floors",
                        value: 56.toString(),
                        height: screenHeight * 0.25,
                        width: screenWidth * 0.35,
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
