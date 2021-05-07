import 'package:flutter/material.dart';
import 'package:tournament/api_service.dart';
import 'package:tournament/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ApiService();
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
