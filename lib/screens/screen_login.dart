import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proj1/content/text_content.dart';
import 'dart:async';

import 'package:proj1/screens/screen1.dart';
var uid;
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Future login(BuildContext cont) async {
    if (email.text == "" || password.text == "") {
      Fluttertoast.showToast(
        msg: "Fields cannot be blank",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        fontSize: 16.0,
      );
    } else {
      var url = "http://10.2.90.86/login.php";
      var urlf = Uri.parse(url);
      try {
        var response = await http.post(urlf,
            body: {"email": email.text, "password": password.text});
        var data = jsonDecode(response.body);
        if (data != "error") {
          uid = data;
          //print(uid);
          Navigator.pushAndRemoveUntil(
              cont,
              MaterialPageRoute(builder: (context) => const Screen1Mat()),
              (route) => false);
        }else {
          Fluttertoast.showToast(
            msg: "The email and password are wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            fontSize: 16.0,
          );
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const LoginTitle(),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const Text(
            //   'Login',
            //   style: TextStyle(
            //     fontSize: 35,
            //     color: Colors.deepPurple,
            //   ),
            // ),

            TextField(
              controller: email,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                prefixIcon: const Icon(Icons.email),
                hintText: "email",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  prefixIcon: const Icon(Icons.password),
                  hintText: "password",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: MaterialButton(
                minWidth: double.infinity,
                onPressed: () {
                  login(context);
                  debugPrint('login pressed');
                },
                color: Colors.deepPurple,
                child: const Text(
                  'login',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
        backgroundColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
getUid(){
  return uid[0];
}
