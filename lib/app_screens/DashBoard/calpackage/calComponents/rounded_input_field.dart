import 'package:basic/Constants.dart';
import 'package:flutter/material.dart';



class RoundedInputField extends StatelessWidget {
  final String hintText;
  final String title;
  final TextEditingController Controller;
  final ValueChanged<String> ?onChanged;
  final TextInputType checKeyboardType;
  const RoundedInputField({
    required this.hintText,
    required this.title,
    required this.onChanged,
    required this.Controller,
    required this.checKeyboardType
  });

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.bodyText1;
    return  Padding(
      padding: EdgeInsets.only(left: 30.0,right: 30.0),
      child: TextField(
       // controller: titleController,
        style: textStyle,
        onChanged: this.onChanged,
        keyboardType: this.checKeyboardType,
        controller: Controller,
        decoration: InputDecoration(
            labelText: title,
            hintText: hintText,
            labelStyle: textStyle,

            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0)
            )
        ),
      ),
    );
  }
}
