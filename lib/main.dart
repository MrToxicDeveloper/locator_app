import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locator_app/Map/view/map_screen.dart';
import 'package:locator_app/locator/view/locator_view.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => LocatorView(),
        'map': (context) => Mapscreen(),
      },
    ),
  );
}