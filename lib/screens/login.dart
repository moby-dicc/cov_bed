import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cov_bed/screens/fillupform.dart';
import 'package:cov_bed/screens/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //google signin
  final GoogleSignIn _googleSignIn = new GoogleSignIn();
  final Firestore db = Firestore.instance;

  //Google Login
  Future<FirebaseUser> _handleGoogleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    print(user.email + ' ' + user.photoUrl);
    db.collection('user').document(user.uid).get().then((value) => {
          if (!value.exists)
            {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => NewUserForm()))
            }else{
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MyHomePage()))
            }
        });
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid Bed"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed:  _handleGoogleSignIn,
          child: Text("Login"),
        ),
      ),
    );
  }
}
