import 'package:cov_bed/screens/homepage.dart';
import 'package:cov_bed/utlis/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {

    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          FirebaseUser user = snapshot.data;
          if (user == null) {
            return MyHomePage();
          }
          return MyHomePage();
        } else {
          return Scaffold(
            body: Center(
              child: Loader(),
            ),
          );
        }
      },
    );
  }
}