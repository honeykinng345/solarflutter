import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PricesScreen extends StatefulWidget {

  final String title;
  var list;
  PricesScreen({
  required  this.title,
    required this.list
});
  @override
  State<StatefulWidget> createState() {
    this.list;
    return PrintScreenState(this.list,this.title);
  }
}

class PrintScreenState extends State<PricesScreen> {

  var _currencies;
  var _currenciess =  ["Rupees", "Dollars", "Pounds", "Others"];
  var _currentItemSelected = null;
  var title;
  PrintScreenState(this._currencies, this.title);


  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    return Container(

        color: Colors.transparent,
        padding: EdgeInsets.only(left: 30.0,right: 30.0),
        child: Container(
          height: 50,

          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(left: 10),
                child:    Text(this.title),),


              Padding(padding: EdgeInsets.only(left: 10.0),child:VerticalDivider(
                color: Colors.black,
                thickness: 2,
              ) ,),
             Expanded(child:  DropdownButtonHideUnderline(
               child:   DropdownButton<String>(
                 items:  _currencies.map<DropdownMenuItem<String>>((value) =>
                 new DropdownMenuItem<String>(
                   value: value,
                   child:  Text(value),
                 )
                 ).toList(),
                 onChanged: (String? newValue) {

                   _onDropDownItemSelected(newValue!);

                 },
                 value: _currentItemSelected,
                 hint:  Text(title),


               ),

             ),

      ),


            ],
          ),
        ));

  }
  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }
}
