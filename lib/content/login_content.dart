import 'package:flutter/material.dart';
import 'package:proj1/content/text_content.dart';
import 'package:proj1/screens/screen1.dart';

class LoginBar extends StatelessWidget {
  const LoginBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Screen1()),
              (route) => false);
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.deepPurple,
          shape: const StadiumBorder(),
        ),
        child: const LoginText());
  }
}
