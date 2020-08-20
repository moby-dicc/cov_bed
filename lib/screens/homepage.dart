import 'package:cov_bed/components/customCard.dart';
import 'package:cov_bed/components/smallCard.dart';
import 'package:cov_bed/model/patients.dart';
import 'package:cov_bed/screens/patient.dart';
import 'package:cov_bed/utlis/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Patient> patients = [
    Patient(
      id: "1234",
      name: "Prateek Mohanty",
      arrivaldate: "2020-07-21",
      temp: 36,
      pH: 7.2,
      spo: 98.0,
      heartrate: 68,
      lastValue: 45,
    ),
    Patient(
      id: "1235",
      name: "Sai Mohanty",
      arrivaldate: "2020-07-20",
      temp: 36,
      pH: 7.2,
      spo: 98.0,
      heartrate: 68,
      lastValue: 45,
    ),
    Patient(
      id: "1236",
      name: "Animesh Kar",
      arrivaldate: "2020-07-13",
      temp: 36,
      pH: 7.2,
      spo: 98.0,
      heartrate: 68,
      lastValue: 45,
    ),
    Patient(
      id: "1237",
      name: "Prateek Mohanty",
      arrivaldate: "2020-07-20",
      temp: 36,
      pH: 7.2,
      spo: 98.0,
      heartrate: 68,
      lastValue: 45,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("DashBoard"),
      ),
      body: Container(
          height: screenHeight,
          width: screenWidth,
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(
              screenWidth * 0.12, 30, screenWidth * 0.12, 0),
          child: Column(
            children: <Widget>[
              Center(
                child: Text("List of Beds"),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: patients.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 80,
                    width: double.infinity,
                    child: new Card(
                      elevation: 8.0,
                      margin: new EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 6.0),
                      child: Container(
                        child: ListTile(
                          leading: Container(
                            padding: EdgeInsets.only(right: 12.0),
                            decoration: new BoxDecoration(
                              border: new Border(
                                right: new BorderSide(
                                    width: 1.0, color: Colors.black),
                              ),
                            ),
                            child: new SvgPicture.asset(
                              "assets/icons/account_circle.svg",
                              color: Colors.blue,
                            ),
                          ),
                          title: new Text(
                            "Bed No $index",
                            style: TextStyle(
                                fontFamily: 'B612', color: Colors.black),
                          ),
                          trailing: RaisedButton.icon(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: 
                                (context)=> PatientPage(patient: patients[index],)));
                              },
                              icon: Icon(Icons.arrow_forward_ios),
                              label: Text("")),
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
    );
  }
}
