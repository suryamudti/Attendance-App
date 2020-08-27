import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_storage/src/ui/history_page.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double seconds;
  bool pointsShow = false;

  _currentTime() {
    String minute = DateTime.now().minute.toString();
    if(DateTime.now().minute < 10) minute = "0$minute";
    String points =  pointsShow ? ":" : " ";
    return "${DateTime.now().hour} $points $minute";
  }

  _triggerUpdate() {
    Timer.periodic(
        Duration(seconds: 1),
            (Timer timer) => setState(() {
              if(pointsShow) pointsShow = false;
              else pointsShow = true;
              seconds = DateTime.now().second / 60;
            },
        ));
  }

  @override
  void initState() {
    super.initState();
    seconds = DateTime.now().second / 60;
    _triggerUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance"),
        actions: <Widget>[
          FlatButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
                builder:(_)=>HistoryPage()));
          }, child: Text("History"))
        ],
      ),
      body: Container(
          margin: const EdgeInsets.all(36.0),
          width: 340,
          height: 140,
          child: Center(
            child: Text(
              _currentTime(),
              style: GoogleFonts.bungee(
                  fontSize: 60.0,
                  textStyle: TextStyle(color: Colors.black),
                  fontWeight: FontWeight.normal),
            ),
          )),
    );
  }

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
