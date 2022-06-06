import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Center(
                child: Text('Tunisair',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 39,
                        color: Colors.red[800]))),
            backgroundColor: Colors.transparent,
            elevation: 0),
      ),
    );
  }
}
