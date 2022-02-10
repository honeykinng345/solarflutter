import 'package:basic/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class RoundedButton extends StatelessWidget {
  final String text;
    final Function press;
  final Color color, textColor;
  const RoundedButton({
    required this.text,
    required this.press,
    this.color = Constant.kPrimaryColor,
    this.textColor = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
  return Container(
        margin: EdgeInsets.only(top: 10.0),
        width: 120.0,
        height: 40.0,
        child: ElevatedButton(
          onPressed: () => this.press,
          child: Text(
            text,
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w700),
          ),
          style: ElevatedButton.styleFrom(
              shadowColor: Colors.black,
              onSurface: Colors.pink,
              primary: Constant.kPrimaryColor,
              elevation: 10.0,
              padding: EdgeInsets.all(10.0)),
        ));
  }


}
