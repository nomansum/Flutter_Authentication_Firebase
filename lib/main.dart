import 'package:auth/models/user.dart';
import 'package:auth/screens/wrapper.dart';
import 'package:auth/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<UserDetails?>(
            create: (_) => AuthService().user, initialData: null)
      ],
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
