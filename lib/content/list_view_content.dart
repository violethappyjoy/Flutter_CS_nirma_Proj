import 'package:flutter/material.dart';
import 'package:proj1/content/container_content.dart';
import 'package:proj1/content/profile_content.dart';
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

class ProfileList extends StatelessWidget {
  const ProfileList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listview = ListView(
      children: [
        const SizedBox(
          height: 230,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(children: const [
              SizedBox(
                width: 15,
              ),
              Text(
                "ID:",
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 35,
                  fontFamily: 'SofiaSansCondensed',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                width: 25,
              ),
              ProfID(), //Future ID
            ]),
            const SizedBox(
              height: 25,
            ),
            Row(children: const [
              SizedBox(
                width: 15,
              ),

              Text(
                "Name:",
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 35,
                  fontFamily: 'SofiaSansCondensed',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                width: 25,
              ),
              ProfName() //Future Name
            ]),
            const SizedBox(
              height: 25,
            ),
            Row(children: const [
              SizedBox(
                width: 15,
              ),
              Text(
                "Phone No.:",
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 35,
                  fontFamily: 'SofiaSansCondensed',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                width: 25,
              ),
              ProfPhno() //Future Phone Number
            ]),
            const SizedBox(
              height: 25,
            ),
            Row(children: const [
              SizedBox(
                width: 15,
              ),
              Text(
                "Email:",
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 35,
                  fontFamily: 'SofiaSansCondensed',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                width: 25,
              ),
              ProfEmail()
              // Text(
              //   "Lorem ipsum",
              //   style: TextStyle(
              //     color: Colors.white,
              //     decoration: TextDecoration.none,
              //     fontSize: 30,
              //     fontFamily: 'SofiaSansCondensed',
              //     fontWeight: FontWeight.w400,
              //   ),
              // )
            ]),
            const SizedBox(
              height: 25,
            ),
            Row(children: const [
              SizedBox(
                width: 15,
              ),
              Text(
                "D.O.B.:",
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 35,
                  fontFamily: 'SofiaSansCondensed',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                width: 25,
              ),
              ProfDob()
            ]),
            const SizedBox(
              height: 25,
            ),
            Row(children: const [
              SizedBox(
                width: 15,
              ),
              Text(
                "Address:",
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 35,
                  fontFamily: 'SofiaSansCondensed',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                width: 25,
              ),
              ProfAddr() //Future Address
            ]),
            const SizedBox(
              height: 25,
            ),
          ],
        )
      ],
    );
    return listview;
  }
}
