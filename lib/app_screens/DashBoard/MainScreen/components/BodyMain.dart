import 'package:flutter/material.dart';
import 'MainBackground.dart';
import 'CardSquareButton.dart';

class BodyMain extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> ImageArr = ['images/calculator.png', 'images/cart.png','images/maintenance.png','images/history.png'];

    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 20.0),
      child:  MainBackground(
        child: SingleChildScrollView(
          child:  Column(

            children: <Widget>[

              getMainButton(ImageArr[0],'Calculator',ImageArr[1],'Shopping',true),
              // Divider(),
              getMainButton(ImageArr[2],'Maintenances',ImageArr[3],'History',false),

              // SqaureButtn.buildDivider(),

            ],
          ),



        ),
      ) ,
    );


  }

}

Row getMainButton(String imagePath,titleName,String imagepath2,String titleName2,bool checkMargin){
  return Row(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: SqaureButtn(imagePath,titleName,checkMargin),),
      Padding(padding: EdgeInsets.symmetric(horizontal: 2),
        child:  SqaureButtn(imagepath2,titleName2,checkMargin),
      )
      // SqaureButtn.buildDivider(),

    ],
  );
}
