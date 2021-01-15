import 'package:campus_buddy/screen/widget/build_box.dart';
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
        elevation: 0.0,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.height * 0.04),
            child: Icon(Icons.person_pin,
                size: size.height * 0.04, color: Colors.black),
          ),
        ],
        backgroundColor: Colors.white,
        title: Text(
          "Campus Buddy",
          style: TextStyle(
            color: Colors.green,
            fontSize: size.height * 0.030,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.75,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          //header
          SliverToBoxAdapter(
            child: Container(
              height: size.height * 0.15,
              alignment: Alignment.center,
              width: double.infinity,
              color: Constants.headerColor,
              child: Text(
                Constants.headerText,
                style: TextStyle(
                  fontSize: size.height * 0.036,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          //Gridview 
          BuildBox(),
          //footer
          SliverPadding(
            padding: EdgeInsets.only(bottom: size.height * 0.06),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: size.height * 0.13,
              alignment: Alignment.center,
              width: double.infinity,
              color: Constants.headerColor,
              child: Text("Footer Contain"),
            ),
          ),
        ],
      ),
    );
  }
}
