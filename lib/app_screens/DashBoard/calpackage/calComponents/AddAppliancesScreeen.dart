import 'dart:developer';

import 'package:basic/Constants.dart';
import 'package:basic/main.dart';
import 'package:basic/models/Appliances.dart';
import 'package:flutter/cupertino.dart';
import 'package:basic/app_screens/DashBoard/calpackage/calComponents/rounded_input_field.dart';
import 'package:basic/app_screens/DashBoard/calpackage/calComponents/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:basic/app_screens/DashBoard/calpackage/calComponents/PricesScreen.dart';
import 'package:basic/utilis/SnackBar.dart';
import 'package:basic/utilis/Helper.dart';
import 'package:basic/utilis/database_helper.dart';
import 'package:provider/src/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:basic/app_screens/DashBoard/calpackage/calComponents/CalBody.dart';

class AddApplicances extends StatefulWidget {



  @override
  State<StatefulWidget> createState() {
    return applianceState();
  }
}

class applianceState extends State<AddApplicances> {


  TextEditingController applicanceEt = TextEditingController();
  TextEditingController wattEt = TextEditingController();
  TextEditingController quantityEt = TextEditingController();
  String applicanceValue = '';
  String wattValue = '';
  String quantityValue = '';
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Appliances>? noteList;
  int count = 0;


  @override
  Widget build(BuildContext context) {
    if (noteList == null) {
      noteList = List<Appliances>.empty(growable: true); // []
     updateListView();
    }
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 20),
      child: Center(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
            children: <Widget>[
              /*if (check) */ RoundedInputField(
                checKeyboardType: TextInputType.name,
                hintText: 'Enter  Appliance Name',
                onChanged: (value) {
                  applicanceValue = value;
                },
                title: 'Appliance',
                Controller: applicanceEt,
              ),
              /*else
                 Padding(padding:   EdgeInsets.only(left: 30.0,right: 30.0),
                     child:PricesScreen(title: 'Choose Bettry',list: ["Rupees", "Dollars", "Pounds", "Others"],)),*/
              Container(
                height: 10,
              ),
              RoundedInputField(
                checKeyboardType: TextInputType.number,
                hintText: 'Enter Device Rating In watts',
                onChanged: (value) {
                  wattValue = value;
                },
                title: 'Watts',
                Controller: wattEt,
              ),
              Container(
                height: 10,
              ),
              RoundedInputField(
                checKeyboardType: TextInputType.number,
                hintText: 'Enter Appliance Quantity',
                onChanged: (value) {
                  quantityValue = value;
                },
                title: 'Quantity',
                Controller: quantityEt,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: ElevatedButton(
                          onPressed: () => Validation(),
                          child: Text(
                            "Add Items",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w700),
                          ),
                          style: ElevatedButton.styleFrom(
                              shadowColor: Colors.black,
                              onSurface: Colors.pink,
                              primary: Colors.lightBlue,
                              elevation: 10.0,
                              padding: EdgeInsets.all(10.0)),
                        )),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 30),
                      child: ElevatedButton(
                        onPressed: () => sendValidation(),

                        child: Text(
                          "Calculate",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700),
                        ),
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.black,
                            onSurface: Colors.pink,
                            primary: Colors.lightBlue,
                            elevation: 10.0,
                            padding: EdgeInsets.all(10.0)),
                      ),
                    ),
                  ],
                ),
              ),
              getNoteListView(),
            ],
          ),
        ),
      ),
    );
  }

  getNoteListView() {
    TextStyle? titleStyle = Theme.of(context).textTheme.bodyText1;

    return  ListView.builder(
      shrinkWrap: true,
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Container(
          alignment: Alignment.center,
          width: 200,
          height: 80,
          child: Card(
              color: Colors.white,
              elevation: 2.0,
              child:Padding(
                padding: EdgeInsets.only(top: 10,left: 10,right: 10),
                child:
                Row(
                  children: <Widget>[

                    Column(
                      children: <Widget>[
                        Text("Appliance Name"),
                        Padding(padding: EdgeInsets.only(top: 10.0),
                        child: Text(this.noteList![position].mApplianceName!), )

                      ],
                    ),
                    Spacer(),
                    Column(
                      children: <Widget>[
                        Text("Watt"),
                        Padding(padding: EdgeInsets.only(top: 10.0),
                          child: Text(this.noteList![position].mApplianceWattage!), )
                      ],

                    ),
                    Spacer(),
                    Column(
                      children: <Widget>[
                        Text("Quantity"),
                        Padding(padding: EdgeInsets.only(top: 10.0),
                          child: Text(this.noteList![position].mApplianceQuantity!), )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(height: 30,width: 70,child: Padding(padding: EdgeInsets.only(left: 10.0),child:
                        TextButton(
                            child: Text(
                                "Delete".toUpperCase(),
                                style: TextStyle(fontSize: 8.0)
                            ),
                            style: ButtonStyle(

                                foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.red)
                                    )
                                )
                            ),
                            onPressed: () => DeleteItem(noteList![position].id!)
                        ),) ,)

                    ,
                      ],
                    ),
                  ],
                )),
              )


        );
      },
    );
  }

  Future<void> Validation() async {

      if (Helper.checkFeild(applicanceValue)) {
        Helper.showSnackBar(context, "Please add Appliance First");
      } else if (Helper.checkFeild(wattValue)) {
        Helper.showSnackBar(context, "Please add watt First");
      } else if (Helper.checkFeild(quantityValue)) {
        Helper.showSnackBar(context, "Please add quantity First");
      } else {
        int result;
        Appliances appliances = Appliances.empty();
        appliances.mApplianceName = applicanceValue;
        appliances.mApplianceWattage = wattValue.toString();
        appliances.mApplianceQuantity = quantityValue.toString();

        result = await databaseHelper.insertNote(appliances);
        if (result != 0) {
          applicanceValue = '';
          wattValue = '';
          quantityValue = '';
          quantityEt.text ='';
          updateListView();
        } else {
          _showAlertDialog("Alert", "Not Added");
        }
      }

  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Appliances>> noteListFuture = databaseHelper.getNoteList();

      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;

        });
      });
    });
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  DeleteItem(int position) async {


    setState(() async {
      int result = await databaseHelper.deleteNote(position);
      if (result != 0) {
        updateListView();
        _showAlertDialog('Status', 'Item Deleted Successfully');
      } else {

        _showAlertDialog('Status', 'Error Occured while Deleting Note');
      }
    });


    // Case 2: User is trying to delete the old note that already has a valid ID.

  }

  sendValidation() {
    if(noteList!.length <= 0){
      Helper.showSnackBar(context, "Please add item first ");

    }else {
      calculateValues();
      var timerInfo = Provider.of<Counter>(context, listen: false);
      timerInfo.updateValue();

     // this.call('helloo');
    }
  }

  void calculateValues() {
    for(int i =0 ;i <noteList!.length;i++){
    Helper.totalCalculate = Helper.totalCalculate +
        int.parse(noteList![i].mApplianceQuantity!) +
        int.parse(noteList![i].mApplianceWattage!);
     Helper.totalLabour = Helper.totalLabour +   int.parse(noteList![i].mApplianceWattage!);
    }
    Helper.totalLabour = Helper.totalLabour * 14;
    print(Helper.totalCalculate);
    print(Helper.totalLabour);
  }

}

