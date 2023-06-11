import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proj1/API_Conn/API_Conn.dart';
import 'package:proj1/screens/screen_login.dart';

class ToDo_Form extends StatefulWidget {
  const ToDo_Form({super.key});

  @override
  ToDo_FormState createState() => ToDo_FormState();
}

class ToDo_FormState extends State<ToDo_Form> {
  addtask() async {
    try {
      var res = await http.post(Uri.parse(API.todoForm), body: {
        'uid': uid,
        'title': title.text.trim(),
        'tdesc': desc.text.trimRight(),
        'due': dateCtl.text.trim()
      });
      if (res.statusCode == 200) {
        var resSignup = jsonDecode(res.body);
        if (resSignup['reg']) {
          Fluttertoast.showToast(msg: "Task Added");
        } else {
          Fluttertoast.showToast(msg: "Error");
        }
      }
    } catch (e) {
      print(e);
    }
  }

  var formkey1 = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController dateCtl = TextEditingController();
  TextEditingController desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(
                  context); // Navigate back when the arrow button is pressed
            },
          ),
          title: const Text("To Do"),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Form(
              key: formkey1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  TextFormField(
                    controller: title,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        prefixIcon: const Icon(Icons.perm_identity_sharp),
                        hintText: "Task Title",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0))),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: dateCtl,
                    validator: (val) => val!.isEmpty ? "Enter Due Date" : null,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      prefixIcon: const Icon(Icons.date_range),
                      hintText: "Due Date",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                    onTap: () async {
                      DateTime? date = DateTime.now();
                      TimeOfDay? time = TimeOfDay.now();

                      FocusScope.of(context).requestFocus(FocusNode());

                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: date!,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2025),
                      );

                      if (selectedDate != null) {
                        final selectedTime = await showTimePicker(
                          context: context,
                          initialTime: time!,
                        );

                        if (selectedTime != null) {
                          date = DateTime(
                            selectedDate.year,
                            selectedDate.month,
                            selectedDate.day,
                            selectedTime.hour,
                            selectedTime.minute,
                          );

                          dateCtl.text =
                              "${date!.year}-${date.month}-${date.day} ${date.hour}:${date.minute}:00";
                        }
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                    controller: desc,
                    validator: (val) => val == " " ? "Enter Description" : null,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        prefixIcon: const Icon(Icons.post_add),
                        hintText: "\nDescription",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0))),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            ElevatedButton(
              onPressed: () {
                addtask();
                debugPrint("Submit Clicked");
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                minimumSize: MaterialStateProperty.all<Size>(Size(100, 50)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.deepPurple),
              ),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
