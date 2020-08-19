import 'package:flutter/material.dart';

class NewUserForm  extends StatefulWidget {
  NewUserForm({Key key}) : super(key: key);
  @override
  _NewUserFormState createState() => _NewUserFormState();
}

class _NewUserFormState extends State<NewUserForm> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid Bed"),
      ),
      body: Center(
        child: Text("Fill Up Form"),
      ), 
    );
  }
}
