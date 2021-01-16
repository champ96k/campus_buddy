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
    return Scaffold(
      body: Center(
        child: Text("data ${widget.response['lastDate']}")
      ),
    );
  }
}
