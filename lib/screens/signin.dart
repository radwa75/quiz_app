// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/screens/sub_choice.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  String? _usernameError;

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _validateUsername(String value) {
    if (value.isEmpty) {
      setState(() {
        _usernameError = "Username is required";
      });
    } else if (value.length < 10) {
      setState(() {
        _usernameError = "Username should be at least 10 characters";
      });
    } else if (value[0].toUpperCase() != value[0]) {
      setState(() {
        _usernameError = "First letter should be uppercase";
      });
    } else {
      setState(() {
        _usernameError = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 36, 125, 163),
              Color.fromARGB(255, 241, 221, 145),
              Color.fromARGB(255, 185, 207, 224),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Image.asset(
                      'images/logo8.png',
                      height: 150,
                    ),
                  )
                ],
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                padding: EdgeInsets.all(20),
                child: Form(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          padding: EdgeInsets.all(10),
                          child: Column(children: [
                            Text(
                              "Login",
                              style: GoogleFonts.montserrat(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Colors.blue,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.person,
                                    color: Colors.blue,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: _usernameController,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                        hintText: "User Name",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                      validator: (value) {
                                        if (_usernameError != null) {
                                          return _usernameError;
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        _validateUsername(value);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            if (_usernameError != null)
                              Text(
                                _usernameError!,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                              ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  "New in quiz app? ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "Register ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SubChoice()),
                                      // Form is valid, do something
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 250, 217, 118),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  minimumSize: Size(200, 50),
                                ),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Icon(
                              Icons.fingerprint,
                              size: 50,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 20),
                            Text(
                              'put your fingure',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                              ),
                            ),
                            SizedBox(
                              height: 100,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(children: <Widget>[
                                  Checkbox(
                                    value: true,
                                    onChanged: (value) {},
                                    activeColor: Colors.blue,
                                  ),
                                  Text(
                                    "Remember Me",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 60,
                                  ),
                                  Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]),
                              ],
                            ),
                          ])),
                    ])))
          ],
        ),
      ),
    ));
  }
}
