import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Attendance", style: TextStyle(color: Colors.black),),
        actions: <Widget>[
          FlatButton(onPressed: (){}, child: Text("History"))
        ],
      ),
    );
  }
}
