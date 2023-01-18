import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:proj1/screens/screen0.dart';

class LogOutFloatButton extends StatelessWidget {
  const LogOutFloatButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
              child: const Screen0(),
              type: PageTransitionType.fade,
              duration: const Duration(milliseconds: 100),
            ),
            (route) => false);
        debugPrint("Logout clicked");
      },
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
      mini: true,
      tooltip: 'To logout from the app',
      child: const Icon(Icons.logout),
    );
  }
}
