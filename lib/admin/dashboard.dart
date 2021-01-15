import 'package:flutter/material.dart';
// Import the firebase_core and cloud_firestore plugin
import 'package:cloud_firestore/cloud_firestore.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  // Create a CollectionReference called users that references the firestore collection
  CollectionReference info =
      FirebaseFirestore.instance.collection("campusBuddy");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          color: Colors.red,
          onPressed: () {
            addInfo();
          },
          child: Text("Tab"),
        ),
      ),
    );
  }

  Future<void> addInfo() {
    return info
        .add({
          "jobs": [
            {
              "companyName": "Google India",
              "lastDate": "Apply before 20 Jan",
              "roll": "Software Developer",
              "location": "Banglore India",
              "salary": "23 LPA",
              "batch": "2021 Passout",
              "jobId": "12342"
            }
          ]
        })
        .then((value) => print("Info Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
