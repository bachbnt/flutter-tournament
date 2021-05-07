import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:tournament/api_service.dart';
import 'package:tournament/prefrerences_util.dart';
import 'package:tournament/screens/home_screen.dart';
import 'package:tournament/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with AfterLayoutMixin<LoginScreen> {
  final usernameController = TextEditingController();
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text('ĐĂNG NHẬP'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Tài khoản'),
                controller: usernameController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Mật khẩu'),
                controller: passwordController,
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
                  onPressed: loading
                      ? null
                      : () async {
                          setState(() {
                            loading = true;
                          });
                          if (await ApiService().signIn(
                              usernameController.text.trim(),
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
                  child: Text('Đăng nhập'))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    if ((await PreferencesUtil.getToken()) != null) {
      await ApiService().init();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }
}
