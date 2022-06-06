import 'package:flutter/material.dart';

import '../widgets/navigation_drawer_widget.dart';

class ConverssionMiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          backgroundColor: Color(0xFFD80404),
          title: Container(
            padding: EdgeInsets.all(25),
            child: Image.asset(
              "assets/images/tunisair.png",
              height: 60,
            ),
          ),
          elevation: 0.0,
        ),
        body: Column(
          children: [
            Text("Convertissement des Miles Primes en Miles Qualifiants"),
            Text("Miles Prime"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 170,
                    height: 35,
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    )),
              ],
            ),
            Text("Max 15647."),
            Text("Miles Qualifiants"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 170,
                    height: 35,
                    child: TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    )),
              ],
            ),
          ],
        ));
  }
}
