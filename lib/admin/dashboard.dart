import 'package:campus_buddy/utils/constants.dart';
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
      FirebaseFirestore.instance.collection(Constants.collectionName);

  String companyName;
  String lastDate;
  String roll;
  String location;
  String salary;
  String batch;

  TextEditingController jobId = TextEditingController();
  // ignore: avoid_init_to_null
  String imageURL = null;
  String errortext = "";
  String successmsg = "";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.08, vertical: size.height * 0.10),
      child: ListView(
        children: [
          Text("Enter Company Name"),
          SizedBox(
            height: 16.0,
          ),
          TextFormField(
            onChanged: (value) {
              companyName = value;
            },
            maxLines: 3,
            maxLength: 52,
            decoration: InputDecoration(
                hintText: "Google India",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0))),
          ),
          SizedBox(
            height: 16.0,
          ),
          Text("Enter form last Date"),
          SizedBox(
            height: 16.0,
          ),
          TextFormField(
            onChanged: (value) {
              lastDate = value;
            },
            decoration: InputDecoration(
                hintText: "Apply before 26 jan",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0))),
          ),
          SizedBox(
            height: 16.0,
          ),
          Text("Enter job profile"),
          SizedBox(
            height: 16.0,
          ),
          TextFormField(
            onChanged: (value) {
              roll = value;
            },
            decoration: InputDecoration(
                hintText: "Java Developer",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0))),
          ),
          SizedBox(
            height: 16.0,
          ),
          Text("Enter Company location"),
          SizedBox(
            height: 16.0,
          ),
          TextFormField(
            onChanged: (value) {
              location = value;
            },
            decoration: InputDecoration(
                hintText: "Banglore India",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0))),
          ),
          SizedBox(
            height: 16.0,
          ),
          Text("Enter excepted salary"),
          SizedBox(
            height: 16.0,
          ),
          TextFormField(
            onChanged: (value) {
              salary = value;
            },
            decoration: InputDecoration(
                hintText: "3.6 LPA",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0))),
          ),
          SizedBox(
            height: 16.0,
          ),
          Text("Enter batch"),
          SizedBox(
            height: 16.0,
          ),
          TextFormField(
            onChanged: (value) {
              batch = value;
            },
            decoration: InputDecoration(
                hintText: "2021 Batch",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0))),
          ),
          SizedBox(
            height: 16.0,
          ),
          Text("Enter Company logo image url"),
          SizedBox(
            height: 16.0,
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: "www.google.com/siem.png",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0))),
            onChanged: (value) {
              imageURL = value;
            },
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            "$errortext",
            style: TextStyle(color: Colors.red),
          ),
          Text(
            "$successmsg",
            style: TextStyle(color: Colors.green),
          ),
          SizedBox(
            height: 16.0,
          ),
          MaterialButton(
            height: size.height * 0.08,
            minWidth: size.width * 0.06,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            color: Colors.indigo,
            child: Text(
              "Sumit",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              setState(() {
                if (companyName.isEmpty ||
                    batch.isEmpty ||
                    imageURL.isEmpty ||
                    lastDate.isEmpty ||
                    location.isEmpty ||
                    roll.isEmpty ||
                    salary.isEmpty) {
                  errortext = "all field required";
                  successmsg = "";
                } else {
                  errortext = "";
                  successmsg =
                      "Your application has been submitted successfully";
                  addInfo(
                    companyNameController: companyName,
                    batchController: batch,
                    imageURLController: imageURL,
                    lastDateController: lastDate,
                    locationController: location,
                    rollController: roll,
                    salaryController: salary,
                  );
                }
              });
            },
          ),
        ],
      ),
    ));
  }

  Future<void> addInfo({
    companyNameController,
    lastDateController,
    rollController,
    locationController,
    salaryController,
    batchController,
    imageURLController,
  }) {
    return info
        .add({
          "companyName": companyNameController.toString(),
          "lastDate": lastDateController.toString(),
          "roll": rollController.toString(),
          "location": locationController.toString(),
          "salary": salaryController.toString(),
          "batch": batchController.toString(),
          "jobId": "jobId",
          "imageURL": imageURLController.toString()
        })
        .then((value) => {
              print("Done response added"),
              errortext.isEmpty,
              companyName.isEmpty,
              batch.isEmpty,
              imageURL.isEmpty,
              lastDate.isEmpty,
              location.isEmpty,
              roll.isEmpty,
              roll.isEmpty,
              salary.isEmpty,
            })
        .catchError((error) => print("Failed to add user: $error"));
  }
}
