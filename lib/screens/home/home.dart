import 'package:auth/services/auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text("Brew Crew"),
        backgroundColor: Colors.brown[400],
        elevation: 1.0,
        actions: <Widget>[
          ElevatedButton(
            onPressed: () async {
              await _auth.signOut();
            },
            child: Icon(
              Icons.person,
              color: Colors.brown[400],
            ),
          )
        ],
      ),
    );
  }
}
