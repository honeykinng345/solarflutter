import 'package:basic/Constants.dart';
import 'package:flutter/material.dart';
import 'app_screens/loginScreen/LoginBody.dart';
import 'app_screens/DashBoard/MainScreen/Main.dart';
// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(

      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Counter()),
        ],
        child:  MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Expore",
          home: SignUpScreen(),
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Constant.kPrimaryColor,
            colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: Colors.red, // Your accent color
            ),
          ),
        ),
      ),

    );
}
class Counter with ChangeNotifier {


  bool check = true;
  void updateValue() {
   check = false;
    notifyListeners();
  }


}

