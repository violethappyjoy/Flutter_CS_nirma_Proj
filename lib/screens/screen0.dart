import 'package:flutter/material.dart';
import 'package:proj1/content/list_view_content.dart';
import 'package:proj1/content/logout_content.dart';
import 'package:proj1/content/text_content.dart';


class Screen0 extends StatelessWidget {
  const Screen0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: const HomeTitle(),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: const BefLoginList(),
      //floatingActionButton: const LogOutFloatButton(),
      backgroundColor: Colors.black26,
    );
  }
}
