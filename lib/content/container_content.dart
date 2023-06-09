
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:proj1/content/login_content.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proj1/API_Conn/API_Conn.dart';
import 'package:proj1/content/text_content.dart';
import 'package:proj1/content/sql_fetch.dart';
import 'package:proj1/screens/screen_login.dart';


class NameContain extends StatelessWidget {
  const NameContain({Key? key}) : super(key: key);

  Future<dynamic> getName() async {
    var url = Uri.parse(API.getName);
    var response = await http.post(url, body: {'uid': uid});

    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(response.body);
      return decodedResponse[0];
    } else {
      throw Exception('Failed to fetch PHP output');
    }
  }

  Future<String> name() async {
    var str1 = await getName();
    print(uid);
    print('Response from server: $str1');
    try {
      Map<String, dynamic> data = await getName();
      var name = data['name'];
      return name.toString();
    } catch (e) {
      print('Error decoding JSON: $e');
      return '';
    }
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: name(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            alignment: Alignment.topRight,
            color: Colors.white,
            height: 45.0,
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Container(
            alignment: Alignment.topRight,
            color: Colors.white,
            height: 45.0,
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return Container(
            alignment: Alignment.topRight,
            color: Colors.white,
            height: 45.0,
            child: InkWell(
              child: Text(
                snapshot.data!,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 40,
                  fontFamily: 'SofiaSansCondensed',
                  fontWeight: FontWeight.w700,
                ),
              ),
              onTap: () {
                debugPrint("Name clicked");
              },
            ),
          );
        }
      },
    );
  }
}


class LoginContain extends StatelessWidget{
  const LoginContain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      height: 55.0,
      child:  const LoginBar(),

    );
  }

}