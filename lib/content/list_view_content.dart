import 'package:flutter/material.dart';
import 'package:proj1/content/container_content.dart';
import 'package:proj1/content/text_content.dart';

class HomeList extends StatelessWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listView = ListView(children: <Widget>[
      const NameContain(),
      ListTile(
        leading: const Icon(
          Icons.alarm,
          size: 25,
          color: Colors.white,
        ),
        title: const ToDo(),
        onTap: () {
          debugPrint("ToDo clicked");
        },
      ),
      ListTile(
        leading: const Icon(
          Icons.kayaking,
          size: 25,
          color: Colors.white,
        ),
        title: const CurrProj(),
        onTap: () {
          debugPrint("Current Project clicked");
        },
      ),
      ListTile(
        leading: const Icon(
          Icons.dangerous,
          size: 25,
          color: Colors.white,
        ),
        title: const CheckInOut(),
        onTap: () {
          debugPrint("CheckIN CheckOut clicked");
        },
      ),
      ListTile(
        leading: const Icon(
          Icons.radar,
          size: 25,
          color: Colors.white,
        ),
        title: const LeavePlan(),
        onTap: () {
          debugPrint("Leave Plan clicked");
        },
      ),
      ListTile(
        leading: const Icon(
          Icons.radio,
          size: 25,
          color: Colors.white,
        ),
        title: const ArchiveF(),
        onTap: () {
          debugPrint("Archives clicked");
        },
      ),
      ListTile(
        leading: const Icon(
          Icons.newspaper,
          size: 25,
          color: Colors.white,
        ),
        title: const NewsLetter(),
        onTap: () {
          debugPrint("Newsletter clicked");
        },
      )
    ]);
    return listView;
  }
}

class BefLoginList extends StatelessWidget {
  const BefLoginList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listview = ListView(
      children: const <Widget>[
        LoginContain(),
      ],
    );
    return listview;
  }
}
