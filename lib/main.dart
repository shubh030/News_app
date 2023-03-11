import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/register_Screen.dart';
import 'package:flutter_firebase/services/google_sign_in.dart';
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
    ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
    );
    return MaterialApp(
        title: 'Flutter FireBase',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RegisterScreen());
  }
}
