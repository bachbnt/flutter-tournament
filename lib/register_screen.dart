import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text('ĐĂNG KÝ'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Mật khẩu'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ElevatedButton(onPressed: () {}, child: Text('Đăng ký')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
