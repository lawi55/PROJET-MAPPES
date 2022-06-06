import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../helpers/utils.dart';


class SelectedAgencePage extends StatelessWidget {
  String? mapurl;

  SelectedAgencePage({ required this.mapurl });
  

  
  @override
  Widget build (BuildContext context) {
    return WebView(
      initialUrl: this.mapurl,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }

}