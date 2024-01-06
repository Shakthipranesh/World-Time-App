import 'package:flutter/material.dart';
import 'package:world_time/pages/choosing_page.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading_page.dart';

void main() {runApp(MaterialApp(
  initialRoute: "/",
  routes: {

    '/' : (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChoosingLocation(),
  },
));

}

