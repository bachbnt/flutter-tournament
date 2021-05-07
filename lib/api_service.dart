import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tournament/models/signin.dart';
import 'package:tournament/models/signup.dart';
import 'package:tournament/prefrerences_util.dart';

class ApiService {
  static final _instance = ApiService._internal();
  final String _baseUrl = 'https://manage-tournament-api.herokuapp.com/';

  Map<String, String> _headers;

  ApiService._internal();

  factory ApiService() {
    return _instance;
  }

  Future<void> init() async {
    String token = await PreferencesUtil.getToken();
    _headers = {'Authorization': token};
  }

  Future<bool> signIn(String username, String password) async {
    try {
      final raw = await http.post(Uri.parse('${_baseUrl}auth/local/'),
          body: {"identifier": username, "password": password});
      if (raw.statusCode == 200) {
        final res = SignInRes.fromJson(jsonDecode(raw.body));
        await PreferencesUtil.setToken(res.jwt);
        return true;
      }
      return false;
    } catch (error) {
      return false;
    }
  }

  Future<bool> signUp(String username, String email, String password) async {
    try {
      final raw = await http.post(Uri.parse('${_baseUrl}auth/local/register'),
          body: {"username": username, "email": email, "password": password});
      if (raw.statusCode == 200) {
        final res = SignUpRes.fromJson(jsonDecode(raw.body));
        await PreferencesUtil.setToken(res.jwt);
        return true;
      }
      return false;
    } catch (error) {
      return false;
    }
  }

  Future<bool> signOut() async {
    try {
      await PreferencesUtil.removeToken();
      return true;
    } catch (error) {
      return false;
    }
  }
}
