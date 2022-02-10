import 'dart:developer';

import 'package:basic/Constants.dart';
import 'package:basic/main.dart';
import 'package:basic/models/prices_all.dart';
import 'package:basic/utilis/ApiInterFace.dart';
import 'package:basic/utilis/ApiManager.dart';
import 'package:basic/utilis/Helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:basic/app_screens/DashBoard/calpackage/calComponents/rounded_input_field.dart';
import 'package:basic/app_screens/DashBoard/calpackage/calComponents/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:basic/app_screens/DashBoard/calpackage/calComponents/PricesScreen.dart';
import 'package:basic/app_screens/DashBoard/calpackage/calComponents/AddAppliancesScreeen.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

class CalBody extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Helper.getPricesData();
    var timerInfo = Provider.of<Counter>(context, listen: false);
    return
    Consumer<Counter>(builder: (context, data, child) {
      return  data.check? AddApplicances() : Container(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
            children: <Widget>[
              PricesScreen(title: 'Choose Bettry', list: Helper.bettries),
              SizedBox(
                height: 10.0,
              ),
              PricesScreen(
                  title: 'Choose Invertor', list: Helper.inverters),
              SizedBox(
                height: 10.0,
              ),
              PricesScreen(title: 'Choose Plates', list: Helper.plates),
              Container(
                padding: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                child: RoundedButton(
                  text: "Next",
                  press: () {},
                ),
              ),
            ],
          ),
        ),
      );
    },);

  }

}

/*
void bookFlight(BuildContext context) {
  bool checl = true;
  Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () => Navigator.of(context).pop() // dismiss dialog
      );
  var alertDialog = AlertDialog(
    title: Text("Flight Booked Successfully"),
    content: Text("Have a pleasant flight"),
    actions: [
      okButton,
    ],
  );

  showDialog(context: context, builder: (BuildContext context) => alertDialog);
}

void showSnackBar(BuildContext context, String item) {
*/ /*  var snackBar = SnackBar(
    content: Text("You just tapped $item"),
    action: SnackBarAction(
        label: "UNDO",
        onPressed: () {
          debugPrint('Performing dummy UNDO operation');
        }
    ),
  );

  Scaffold.of(context).showSnackBar(snackBar);*/ /*
  Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () => Navigator.of(context).pop() // dismiss dialog
      );
  Widget CanclButton = TextButton(
      child: Text("Canel"),
      onPressed: () => Navigator.of(context).pop() // dismiss dialog
      );
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("Incremented"),
      duration: Duration(milliseconds: 300),
      action: SnackBarAction(
          label: "Undo",
          onPressed: () => debugPrint('Performing dummy UNDO operation')),
    ),
  );
}*/
