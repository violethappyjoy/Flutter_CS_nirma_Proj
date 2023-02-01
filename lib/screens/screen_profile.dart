import 'package:flutter/material.dart';

class profile extends StatefulWidget{
  const profile({super.key});

  @override
 _profileState createState() => _profileState();
}

class _profileState extends State<profile>{
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
            Container(
              width: double.infinity,
              height: 200,
              child: Container(
                alignment: Alignment(0.0, 2.5),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(

                  ),
                  radius: 60.0,
                ),
              ),
            ),
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