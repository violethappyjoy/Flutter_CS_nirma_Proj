import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proj1/API_Conn/API_Conn.dart';
import 'package:proj1/content/text_content.dart';
import 'package:proj1/content/user.dart';
import 'package:proj1/screens/screen0.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<SignupPage> {
  var formkey = GlobalKey<FormState>();
  var confirmPass;
  TextEditingController uid = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phno = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController dateCtl = TextEditingController();
  TextEditingController address = TextEditingController();

  validateEmail(BuildContext context) async {
    try {
      if (uid.text.trim() == "" ||
          name.text.trim() == "" ||
          email.text.trim() == "" ||
          phno.text.trim() == "" ||
          dateCtl.text.trim() == "" ||
          address.text.trim() == "") {
        Fluttertoast.showToast(
          msg: "Fields cannot be blank",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          fontSize: 16.0,
        );
      } else {
        var res = await http.post(
          Uri.parse(API.validateEmail),
          body: {
            'email': email.text.trim(),
          },
        );

        //HTTP OK 200 success code test
        //connection with server -> success
        if (res.statusCode == 200) {
          var resbody = jsonDecode(res.body);
          if (resbody['emailFound']) {
            Fluttertoast.showToast(msg: "Email already in use");
          } else {
            // Fluttertoast.showToast(msg: "Hello");
            regAndStore(context);
          }
        }
      }
    } catch (e) {
      // print(e);
    }
  }

  regAndStore(BuildContext context) async {
    User u = User(
      int.parse(uid.text.trim()),
      name.text.trim(),
      email.text.trim(),
      phno.text.trim(),
      password.text.trim(),
      dateCtl.text.trim(),
      address.text.trimRight(),
    );

    try {
      // print(u.phno);
      var res1 = await http.post(
        Uri.parse(API.signUp),
        body: u.toJson(),
      );
      if (res1.statusCode == 200) {
        print(u.phno);
        var resSignup = jsonDecode(res1.body);
        if (resSignup['reg']) {
          Fluttertoast.showToast(msg: "Registered Successfully");
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Screen0Mat()),
              (route) => false);
        } else {
          Fluttertoast.showToast(msg: "Error");
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const SignupTitle(),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        body: ListView(children: [
          Column(
            children: [
              Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      controller: uid,
                      validator: (val) {
                        // print(val);
                        if (val!.isEmpty) {
                          return "Please Enter your Employyee_Id";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding:
                              const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          prefixIcon: const Icon(Icons.perm_identity_sharp),
                          hintText: "Employee ID",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0))),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: name,
                      // onChanged: (val){
                      //   formkey.currentState?.validate();
                      // },
                      validator: (val) {
                        // print(val);
                        if (val!.isEmpty) {
                          return "Please Enter your Name";
                        } else if (!RegExp(
                                r'^[a-zA-z]{1,25}?\s?[a-zA-z]{1,24}$')
                            .hasMatch(val)) {
                          return "Enter a valid name";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding:
                              const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          prefixIcon: const Icon(Icons.person),
                          hintText: "name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0))),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: email,
                      validator: (val) {
                        // print(val);
                        if (val!.isEmpty) {
                          return "Please Enter your Email";
                        } else if (!RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(val)) {
                          return "Enter a valid Email";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding:
                              const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          prefixIcon: const Icon(Icons.email),
                          hintText: "email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0))),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: phno,
                      validator: (val) {
                        // print(val);
                        if (val!.isEmpty) {
                          return "Please Enter your Phone Number";
                        } else if (!RegExp(
                            r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
                            .hasMatch(val)){
                          return "Invaild Phone Number";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding:
                              const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          prefixIcon: const Icon(Icons.phone),
                          hintText: "Phone Number",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0))),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: password,
                      obscureText: true,
                      validator: (val) {
                        // print(val);
                        confirmPass = val;
                        if (val!.isEmpty) {
                          return "Please Enter your Password";
                        } else if (!RegExp(
                                r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,13}$')
                            .hasMatch(val)) {
                          return "Enter a valid Password";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding:
                              const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          prefixIcon: const Icon(Icons.password),
                          hintText: "password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0))),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: confirmpassword,
                      obscureText: true,
                      validator: (val) {
                        // print(val)
                        if (val!.isEmpty) {
                          return "Please Enter your Password";
                        } else if (val != confirmPass) {
                          return "Passwords do not match";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding:
                              const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          prefixIcon: const Icon(Icons.password_outlined),
                          hintText: "confirm password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0))),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: dateCtl,
                      validator: (val) {
                        // print(val);
                        if (val!.isEmpty) {
                          return "Please Enter your Date of Birth";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding:
                              const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          prefixIcon: const Icon(Icons.date_range),
                          hintText: "Date of Birth",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0))),
                      onTap: () async {
                        DateTime? date = DateTime(1900);
                        FocusScope.of(context).requestFocus(FocusNode());
                        date = await showDatePicker(
                            context: context,
                            initialDate: DateTime(1900, 1),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2006));

                        if (date != null) {
                          //interpolation method to merge strings
                          dateCtl.text =
                              "${date.year}-${date.month}-${date.day}";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      controller: address,
                      validator: (val) {
                        // print(val);
                        if (val!.isEmpty) {
                          return "Please Enter your Address";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding:
                              const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          prefixIcon: const Icon(Icons.house),
                          hintText: "\naddress",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0))),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            //to check if fields are empty or not
                            validateEmail(context);
                          }
                          debugPrint("Sign_Up Pressed");
                        },
                        color: Colors.deepPurple,
                        child: const Text(
                          'Sign-Up',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
              )
            ],
          ),
        ]),
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
