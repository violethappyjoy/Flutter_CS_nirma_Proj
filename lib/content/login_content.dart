import 'package:flutter/material.dart';
import 'package:proj1/content/text_content.dart';
import 'package:proj1/screens/screen1.dart';
import 'package:proj1/screens/screen_login.dart';
import 'package:proj1/screens/screen_signup.dart';

// class LoginBar extends StatelessWidget {
//   const LoginBar({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//         onPressed: () {
//           Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(builder: (context) => const LoginPage()),
//               (route) => false);
//         },
//         style: ElevatedButton.styleFrom(
//           primary: Colors.deepPurple,
//           shape: const StadiumBorder(),
//         ),
//         child: const LoginText());
//   }
// }

class LoginBar extends StatelessWidget {
  const LoginBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 12,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage())
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  shape: const StadiumBorder(),
                ),
                child: const LoginText()),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignupPage())
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  shape: const StadiumBorder(),
                ),
                child: const SignupText()),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                          (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  shape: const StadiumBorder(),
                ),
                child: const AdminText()),
          ],
        )
      ],
    );
  }
}
