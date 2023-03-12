
import 'package:flutter/material.dart';
import 'package:proj1/content/login_content.dart';
import 'package:proj1/content/text_content.dart';
import 'package:proj1/content/sql_fetch.dart';
import 'package:proj1/screens/screen_login.dart';


class NameContain extends StatelessWidget {
  const NameContain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topRight,
        color: Colors.white,
        //margin: EdgeInsets.only(bottom: 2.0),
        // decoration: const BoxDecoration(
        //   boxShadow: [
        //     BoxShadow(
        //       blurRadius: 11,
        //       spreadRadius: 0.0,
        //       offset: Offset(0, 10)
        //     )
        //   ]
        // ),
        height: 45.0,
        child: InkWell(
          child: const NameBar(),
          onTap: () {
            nameS();
            //print(nameS());
            print(getUid());
            debugPrint("Name clicked");
          },
        ));
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