import 'package:flutter/material.dart';
import 'package:proj1/content/list_view_content.dart';
import 'package:proj1/content/text_content.dart';
import 'package:proj1/screens/screen_login.dart';

class Profile extends StatefulWidget{
  const Profile({super.key});

  @override
 _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile>{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // centerTitle: true,
          title: const ProfileTitle(),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        body: const ProfileList(),
        backgroundColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
    );
  }

}