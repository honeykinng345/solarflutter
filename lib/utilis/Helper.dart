import 'package:basic/models/prices_all.dart';
import 'package:basic/utilis/ApiInterFace.dart';
import 'package:flutter/material.dart';

import 'ApiManager.dart';

class Helper {
  static List<String> inverters = List.empty(growable: true);
  static List<String> bettries = List.empty(growable: true);
  static List<String> plates = List.empty(growable: true);
  static double totalCalculate = 0.0;

  static double totalLabour = 0.0;

  static bool checkFeild(String value) {
    if (value.isEmpty || value == '') {
      return true;
    } else {
      return false;
    }
  }

  static showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(milliseconds: 1000),
      ),
    );
  }

  static getPricesData() async {
    PriceWrapper newsModel = await ApiManger().getNews();
/*    inverters [0] = "choose One";
    bettries [0] = "choose One";
    plates [0] = "choose One";*/
    for (int i = 0; i < newsModel.prices.length; i++) {
      switch (newsModel.prices[i].status) {
        case "1":
          {
            inverters.add(

                newsModel.prices[i].name + " = " + newsModel.prices[i].price);
          }
          break;
        case "2":
          {
            bettries.add(
                newsModel.prices[i].name + " = " + newsModel.prices[i].price);
          }
          break;

        case "3":
          {
            plates.add(
                newsModel.prices[i].name + " = " + newsModel.prices[i].price);
          }
          break;
      }
    }
    print("inverters");
    print(inverters);
  }
}
