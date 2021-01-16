import 'package:campus_buddy/screen/widget/info_card.dart';
import 'package:campus_buddy/utils/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.headerColor,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          "Campus Buddy",
          style: TextStyle(
            color: Colors.white,
            fontSize: size.height * 0.030,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.75,
          ),
        ),
      ),
      body: InfoCard(),
    );
  }
}
