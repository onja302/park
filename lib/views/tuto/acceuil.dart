import 'dart:async';

import 'package:flutter/material.dart';
import 'package:share_your_park/const.dart';
import 'package:share_your_park/views/tuto/second.dart';

class Acceuil extends StatefulWidget {
  Acceuil({Key key}) : super(key: key);

  @override
  _AcceuilState createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 4);
    return Timer(duration, route);
  }

  route() {
    Navigator.push(
        context,
        // ignore: missing_required_param
        PageRouteBuilder(
            transitionDuration: Duration(seconds: 1),
            transitionsBuilder: (context, animation, animationTime, child) {
              animation =
                  CurvedAnimation(parent: animation, curve: Curves.easeInCirc);
              return ScaleTransition(
                alignment: Alignment.center,
                scale: animation,
                child: child,
              );
            },
            pageBuilder: (context, animation, animationTime) {
              return Second();
            }));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: kPrimaryGradientColor,
          ),
          child: Align(
            child: Column(
              children: [
                Center(
                  child: Container(
                      margin: EdgeInsets.only(top: height * 0.2),
                      //color: Colors.amber,
                      child: Image.asset(
                        'assets/images/tuto_one.png',
                        width: (width * 60) / 100,
                        height: (height * 45) / 100,
                      )),
                ),
                Align(
                    child: Container(
                  //color: Colors.cyan,
                  margin:
                      EdgeInsets.only(top: height * 0.08, left: width * 0.2),
                  child: Image.asset('assets/images/tuto_two.png'),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
