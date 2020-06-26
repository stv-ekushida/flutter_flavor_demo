import 'package:flutter/material.dart';
import 'package:flutterflavordemo/data/flavor.dart';
import 'package:flutterflavordemo/main/myapp.dart';

void main() {
  FlavorConfig(flavor: Flavor.QA, values: FlavorValues(baseUrl: "https://qa"));
  runApp(MyApp());
}
