
import 'dart:convert';

import 'package:basic/Constants.dart';
import 'package:basic/models/prices_all.dart';
import 'package:basic/utilis/ApiInterFace.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class ApiManger {
  Future<PriceWrapper> getNews() async {
    var client = http.Client();


    var newsModel;

    try {
      var response = await client.post(Constant.base_url);
      if (response.statusCode == 200) {

        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = PriceWrapper.fromJson(jsonMap);
      }else{
      }
    } catch (Exception) {
      return newsModel;
    }

    return newsModel;
  }



}