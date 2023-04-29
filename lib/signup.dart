import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController cpassword = new TextEditingController();
  GlobalKey<FormState> formState = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Form(
            key: formState,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/R.png",
                    width: 150,
                    height: 150,
                  ), // New User Icon
                  Padding(
                    padding: EdgeInsets.only(left:10.0, top:10.0,right:10.0,bottom:25.0),
                    child: Text(
                      "Create New Account",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ), // Create new account text
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                    child: TextFormField(
                      validator: (name) {
                        if (name!.isEmpty) {
                          return "Please enter your email";
                        }
                        final bool nameValid = RegExp("[a-zA-Z]+").hasMatch(name);
                        if (!nameValid) {
                          return "Please enter a valid name";
                        }
                        return null;
                      },
                      controller: name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                        ),
                        prefixIcon: Icon(
                          Icons.person_sharp,
                          color: Colors.orangeAccent,
                        ),
                        labelText: "Name",
                      ),
                    ),
                  ), // Name TextField
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                    child: TextFormField(
                      controller: email,
                      validator: (email) {
                        if (email!.isEmpty) {
                          return "Please enter your email";
                        }
                        final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(email);
                        if (!emailValid) {
                          return "Please enter a valid email";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.orangeAccent,
                        ),
                        labelText: "E-mail",
                      ),
                    ),
                  ), // E-mail TextField
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                    child: TextFormField(
                      validator: (password) {
                        if (password!.isEmpty) {
                          return "Please enter your password";
                        }

                        if (password.length < 8) {
                          return "Password must be 8 characters at least";
                        }
                        return null;
                      },
                      controller: password,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.orangeAccent,
                        ),
                        labelText: "Password",
                      ),
                    ),
                  ), // Password TextField
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                    child: TextFormField(
                      obscureText: true,
                      validator: (cpassword) {
                        if (cpassword!.isEmpty) {
                          return "Please confirm your password";
                        }

                        if (cpassword != password.text) {
                          return "Passwords not match";
                        }
                      },
                      controller: cpassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.orangeAccent,
                        ),
                        labelText: "Confirm Password",
                      ),
                    ),
                  ), // Confirm Password TextField
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.orangeAccent
                    ),
                    margin: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () {
                        if (formState.currentState!.validate()) {
                          print('Hello ${name.text}, Your email is "${email.text}" Your password is "${password.text}"');
                        }
                      },
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ), // Register Buttom
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text("login"),
                        )
                      ],
                    ),
                  ), // Text "Already have an account"
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
