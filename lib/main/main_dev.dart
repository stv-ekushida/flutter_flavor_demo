import 'package:flutter/material.dart';
import 'package:flutterflavordemo/data/flavor.dart';
import 'package:flutterflavordemo/main/myapp.dart';

void main() {
  FlavorConfig(
      flavor: Flavor.DEV, values: FlavorValues(baseUrl: "https://dev"));
  runApp(MyApp());
}
