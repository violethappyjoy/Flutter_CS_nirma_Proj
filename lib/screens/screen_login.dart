import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proj1/API_Conn/API_Conn.dart';
import 'package:proj1/content/text_content.dart';
// import 'dart:async';

import 'package:proj1/screens/screen1.dart';

var uid;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginPage> {
  var formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  login(BuildContext cont) async {
    try {
      if (email.text.trim() == "" || password.text.trim() == "") {
        Fluttertoast.showToast(
          msg: "Fields cannot be blank",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          fontSize: 16.0,
        );
      } else {
        var res = await http.post(Uri.parse(API.signIn), body: {
          'email': email.text.trim(),
          'password': password.text.trim()
        });
        if (res.statusCode == 200) {
          var resbody = jsonDecode(res.body);
          if (resbody['loginSuccess']) {
            var str1 = await getUid(email.text.trim());
            Map<String, dynamic> data = str1;
            uid = data['uid'];
            Navigator.pushAndRemoveUntil(
                cont,
                MaterialPageRoute(builder: (context) => const Screen1Mat()),
                (route) => false);
          } else {
            Fluttertoast.showToast(
                msg: "Error: email not found or wrong password");
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getUid(String email) async {
    var url = Uri.parse(API.getUid);
    var response = await http.post(url, body: {'email': email});

    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(response.body);
      return decodedResponse[0];
    } else {
      throw Exception('Failed to fetch PHP output');
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const LoginTitle(),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  TextFormField(
                    controller: email,
                    validator: (val) =>
                        val == " " ? "Please write email" : null,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        prefixIcon: const Icon(Icons.email),
                        hintText: "email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0))),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: password,
                    obscureText: true,
                    validator: (val) =>
                        val == " " ? "Please write password" : null,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        prefixIcon: const Icon(Icons.password),
                        hintText: "password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0))),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          //to check if fields are empty or not
                          login(context);
                        }
                        debugPrint("Sign_In Pressed");
                      },
                      color: Colors.deepPurple,
                      child: const Text(
                        'Sign-In',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
