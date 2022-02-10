import 'package:flutter/material.dart';
import 'package:basic/app_screens/DashBoard/MainScreen/components/BodyMain.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('DashBoard'),
      ),

      body: BodyMain(),
    );
  }
}
