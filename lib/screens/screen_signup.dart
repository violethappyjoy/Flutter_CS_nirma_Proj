import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';

import 'package:proj1/content/text_content.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupState createState() => _SignupState();
}
class _SignupState extends State<SignupPage>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const SignupTitle(),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        backgroundColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
    );
  }

}