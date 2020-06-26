import 'package:flutter/material.dart';
import 'package:flutterflavordemo/data/flavor.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("${FlavorConfig.instance.values.baseUrl}"),
      ),
    );
  }
}
