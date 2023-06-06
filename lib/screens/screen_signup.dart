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
  TextEditingController uid = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController dateCtl = TextEditingController();
  TextEditingController address = TextEditingController();

  validateEmail(BuildContext context) async
  {
    try {
      if (uid.text.trim() == ""|| name.text.trim() == ""|| email.text.trim() == "" || dateCtl.text.trim() == ""||address.text.trim() == "") {
        Fluttertoast.showToast(
          msg: "Fields cannot be blank",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          fontSize: 16.0,
        );
      }else {
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
            // regAndStore(context);

          }
        }
      }
    }
    catch (e) {
      print(e);
    }
  }


  regAndStore(BuildContext context) async
  {
    User u = User(
        int.parse(uid.text.trim()),
        name.text.trim(),
        email.text.trim(),
        password.text.trim(),
        dateCtl.text.trim(),
        address.text.trimRight(),
    );

    try
    {
      var res1 = await http.post(
        Uri.parse(API.signUp),
        body: u.toJson(),
      );
      if(res1.statusCode == 200){
        var resSignup=jsonDecode(res1.body);
        if(resSignup['reg']){
          Fluttertoast.showToast(msg: "Registered Successfully");
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Screen0Mat()),
                  (route) => false);
          
        }else{
          Fluttertoast.showToast(msg: "Error");
        }

      }
    }
    catch(e)
    {
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
        body: Column(
          children: [
            Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  TextFormField(
                    controller: uid,
                    onChanged: (val){
                      formkey.currentState?.validate();
                    },
                    validator: (val) {
                      print(val);
                      if(val!.isEmpty){
                        return "Please Enter your Employyee_Id";
                      }
                      return null;
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
                    validator: (val) => val == " " ? "Please write name" : null,
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
                    validator: (val) =>
                    val == " " ? "Please write email" : null,
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
                    controller: password,
                    obscureText: true,
                    validator: (val) =>
                    val == " " ? "Please write password" : null,
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
                    controller: dateCtl,
                    validator: (val) =>
                    val == " " ? "Please enter Date of Birth" : null,
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
                        dateCtl.text = "${date.year}-${date.month}-${date.day}";
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
                    validator: (val) =>
                    val == " " ? "Please write address" : null,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        prefixIcon: const Icon(Icons.post_add),
                        hintText: "\naddress",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0))),
                  ),
                  const SizedBox(
                    height: 50,
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
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
