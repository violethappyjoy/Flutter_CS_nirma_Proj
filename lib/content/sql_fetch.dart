import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';

import 'package:proj1/screens/screen_login.dart';

var data;

Future nameS() async {
  //var id = getUid();
  // if (id == "") {
  //   debugPrint("Error: no uid found");
  // } else {
  var u = "http://10.2.90.86/profile.php";
  var url = Uri.parse(u);
  try {
    final response = await http.post(url, body: {"uid": getUid()});
    var data = jsonDecode(response.body);
    if (data != "ERROR") {
      print("var success");
      //retuid(data[0][0]);
      //String str = data[0][1];
      //retname(str);
      print(data[0][1]);
      // uid = data[0][0];
      // name = data[0][1];
      // last = data[0][2];
      // dob = data[0][3];
      // doj = data[0][4];
      // address = data[0][5];
      // leaves = data[0][6];
      // image = data[0][7];
    } else {
      debugPrint("Uid Error");
      return data;
    }
  } catch (e) {
    print(e);
  }
}

