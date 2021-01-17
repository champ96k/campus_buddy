import 'package:campus_buddy/utils/constants.dart';
import 'package:flutter/material.dart';

class DescPage extends StatefulWidget {
  final response;

  const DescPage({Key key, this.response}) : super(key: key);
  @override
  _DescPageState createState() => _DescPageState();
}

class _DescPageState extends State<DescPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  height: size.height * 0.10,
                  width: size.width,
                  color: Constants.descheaderColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${widget.response['companyName']}",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: size.height * 0.04, color: Colors.white),
                      ),
                      Text(
                        "{widget.response['companyWebsite']}",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  )),
              Expanded(
                  child: Container(
                alignment: Alignment.center,
                width: size.width,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          SizedBox(
                            height: size.height * 0.15,
                          ),

                          Image(
                            fit: BoxFit.fitWidth,
                            height: size.height * 0.20,
                            image:
                                NetworkImage("${widget.response['imageURL']}"),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            "${widget.response['roll']}",
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black87,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: size.height * 0.010,
                          ),
                          ListTile(
                            leading: Icon(Icons.map),
                            title: Text(
                              "${widget.response['location']}",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          ListTile(
                            leading: Icon(Icons.monetization_on),
                            title: Text(
                              "${widget.response['salary']}",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.010,
                          ),
                          RaisedButton(
                            onPressed: () {},
                            color: Colors.green,
                            child: Text(
                              "Apply Now",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.010,
                          ),
                          Text(
                            "${widget.response['lastDate']}",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 12.0),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(
                       // color: Colors.teal,
                        child: Column(
                          children: [
                            //About Company
                            Text("data"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
              Container(
                  alignment: Alignment.center,
                  height: size.height * 0.08,
                  width: size.width,
                  color: Colors.deepPurple,
                  child: Text('Footer')),
            ],
          ),
        ),
      ],
    ));
  }
}
