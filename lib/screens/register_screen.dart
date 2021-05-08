import 'package:flutter/material.dart';
import 'package:tournament/api_service.dart';
import 'package:tournament/screens/home_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool loading = false;

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
                decoration: InputDecoration(labelText: 'Tài khoản'),
                controller: usernameController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Email'),
                controller: emailController,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Mật khẩu'),
                controller: passwordController,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ElevatedButton(
                    onPressed: loading
                        ? null
                        : () async {
                            setState(() {
                              loading = true;
                            });
                            if (await ApiService().signUp(
                                usernameController.text.trim(),
                                emailController.text.trim(),
                                passwordController.text.trim())) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Thất bại')));
                            }
                            setState(() {
                              loading = false;
                            });
                          },
                    child: Text('Đăng ký')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
