import 'package:auth/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../shared/constants.dart';
import '../../shared/loading.dart';

class SignIn extends StatefulWidget {
  //const SignIn({super.key});

  final Function toggleView;

  SignIn({required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  bool loading = false;
  String error = "";

  final _formkey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailEditingController.dispose();
    passwordEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text('Sign in to Brew Crew'),
              actions: [
                TextButton.icon(
                    onPressed: () {
                      widget.toggleView();
                    },
                    icon: Icon(Icons.person),
                    label: Text("Register"))
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: "Email"),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "enter an email";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      controller: emailEditingController,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration:
                          textInputDecoration.copyWith(hintText: "Password"),
                      validator: (value) {
                        if (value != null && value.length < 6) {
                          return "enter password 6 char long";
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      controller: passwordEditingController,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.amber[800]),
                      ),
                      onPressed: () async {
                        if (_formkey.currentState != null &&
                            _formkey.currentState!.validate()) {
                          //loading = true;

                          setState(() {
                            loading = true;
                          });

                          dynamic result = await _auth
                              .signInWithEmailAndPasswordNow(email, password);

                          if (result == null) {
                            loading = false;
                            error = "Invalid Creds";
                            setState(() {});
                            // setState(() {});
                          }
                        }
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
