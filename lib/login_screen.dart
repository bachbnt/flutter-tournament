import 'package:flutter/material.dart';
import 'package:tournament/home_screen.dart';
import 'package:tournament/register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text('ĐĂNG NHẬP'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Mật khẩu'),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0, top: 16.0),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()),
                      );
                    },
                    child: Text('Đăng ký')),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: Text('Đăng nhập'))
            ],
          ),
        ),
      ),
    );
  }
}
