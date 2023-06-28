import 'package:auth/models/user.dart';
import 'package:auth/screens/authenticate/authenticate.dart';
import 'package:auth/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserDetails?>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
