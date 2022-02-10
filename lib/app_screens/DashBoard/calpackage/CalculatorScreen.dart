import 'package:flutter/material.dart';
import 'package:basic/app_screens/DashBoard/calpackage/calComponents/CalBody.dart';

class CalMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Calculator'),

      ),
     body: CalBody(),
    );
  }
}
