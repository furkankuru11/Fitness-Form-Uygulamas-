import 'package:flutter/material.dart';
import 'package:stajapp1/screens/loginScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness',
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
