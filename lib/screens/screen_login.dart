import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Login Page'),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            // const Text(
            //   'Login',
            //   style: TextStyle(
            //     fontSize: 35,
            //     color: Colors.deepPurple,
            //   ),
            // ),

            Form(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        filled: true,
                        labelText: 'Email',
                        hintText: 'Enter Email',
                        prefixIcon: Icon(Icons.email),
                        prefixIconColor: Colors.deepPurple,
                        fillColor: Colors.white,
                        hoverColor: Colors.white,
                        focusColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (String value){

                      },
                      validator: (value){
                        return value!.isEmpty?'Please enter email': null;
                      },
                    ),
                  ),

                  const SizedBox(height: 30,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        filled: true,
                        labelText: 'Password',
                        hintText: 'Enter Password',
                        prefixIcon: Icon(Icons.password),
                        prefixIconColor: Colors.deepPurple,
                        fillColor: Colors.white,
                        hoverColor: Colors.white,
                        focusColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (String value){

                      },
                      validator: (value){
                        return value!.isEmpty?'Please enter password': null;
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: MaterialButton(
                minWidth: double.infinity,
                onPressed: (){
                  debugPrint('login pressed');
                },
                color: Colors.deepPurple,
                child: const Text(
                  'login',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
        backgroundColor: Colors.black,

      ),
      debugShowCheckedModeBanner: false,
    );
  }

}
