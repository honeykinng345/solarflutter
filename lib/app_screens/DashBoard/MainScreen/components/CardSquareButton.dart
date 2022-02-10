import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:basic/app_screens/DashBoard/calpackage/CalculatorScreen.dart';

class SqaureButtn extends StatelessWidget {

  String image;
  String title;
  bool marginCheck;

  SqaureButtn(
     this.image,
     this.title,
     this.marginCheck,
  );

  @override
  Widget build(BuildContext context) {

   return Center(
     child: Container(
      // padding: EdgeInsets.only(left: 40),
      // padding: EdgeInsets.symmetric(horizontal: 60.0),
       margin: marginCheck ?EdgeInsets.symmetric(vertical: 50):EdgeInsets.symmetric(vertical: 2),
       alignment: Alignment.center,
       child: GestureDetector(
         child:   Card(

           elevation: 10.0,
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
           child: SizedBox(
             height: 120,
             width: 120,
             child: Column(
               children: <Widget>[
                 getImage(image),
                 buildDivider(),
                 Expanded(child:
                 Text(title,
                   textAlign: TextAlign.center,
                   style: TextStyle(color: Colors.black,fontSize: 10),
                 )
                 )



               ],
             ),
           ),
         ) ,
         onTap:()=>Navigator.push(context, MaterialPageRoute(builder: (context) {
           return CalMain();
         })),
       )



     ),
   );



  }
 Container getImage(String i){
    AssetImage assetImage = AssetImage(i);
   Image image = Image(
     image: assetImage,
     width: 50.0,
     height: 50.0,
   );
   return Container(
     child: image,
     alignment: Alignment.center,
     margin: EdgeInsets.only(top: 20.0),
   );
  }
 static Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color: Color(0xFFD9D9D9),
        height: 1.5,
      ),
    );
  }

}
