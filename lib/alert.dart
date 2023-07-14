import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_build/screens/utils/constants.dart';

class Alert extends StatefulWidget {
 const  Alert({Key? key}) : super(key: key);

  @override
  _AlertState createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(children: [
        showAlert(context),
      ],)
      
    );
  }
}
showAlert(BuildContext context) {
    showDialog(
      barrierColor: kPrimaryColor,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text('Alert Message Title Text.'),
        actions: <Widget>[
          FlatButton(
            child: new Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
     },
    );
  }