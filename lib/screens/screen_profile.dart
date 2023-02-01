import 'package:flutter/material.dart';
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
          title: const Text(
            'Profile Page',
          ),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Container(
            //   width: double.infinity,
            //   height: 200,
            //   child: Container(
            //     alignment: Alignment(0.0, 2.5),
            //     child: CircleAvatar(
            //       backgroundImage: NetworkImage(
            //         imgurl,
            //       ),
            //       radius: 60.0,
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
    );
  }

}