import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class Constant {

  static const kPrimaryColor = Color(0xFF6F35A5);
  static  const kPrimaryLightColor = Color(0xFFF1E6FF);

  static String base_url = 'http://192.168.10.16/solar/Apis/get_All_prices.php';




static void   showDialoug (bool value){

  Container(
    width: 50,
    height: 50,
    child: value? AlertDialog(

      title: Text('Please Wait'),  // To display the title it is optional
      // Message which will be pop up on the screen
      // Action widget which will provide the user to acknowledge the choice
      actions: [
       Center(
         child: CircularProgressIndicator(),
       )
      ],
    ): null
  );


}

}