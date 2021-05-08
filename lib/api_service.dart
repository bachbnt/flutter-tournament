import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tournament/models/board.dart' as b;
import 'package:tournament/models/match.dart';
import 'package:tournament/models/signin.dart';
import 'package:tournament/models/signup.dart';
import 'package:tournament/models/team.dart' as t;
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
    _headers = {'Authorization': 'Bearer ${token}'};
  }

  Future<bool> signIn(String username, String password) async {
    try {
      final raw = await http.post(Uri.parse('${_baseUrl}auth/local/'),
          body: {"identifier": username, "password": password});
      if (raw.statusCode == 200) {
        final res = SignInRes.fromJson(jsonDecode(raw.body));
        await PreferencesUtil.setToken(res.jwt);
        await init();
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
        await init();
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
      await init();
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<bool> postTeam(String name) async {
    try {
      final raw = await http.post(Uri.parse('${_baseUrl}teams'),
          body: {'name': name}, headers: _headers);
      if (raw.statusCode == 200) {
        return true;
      }
      return false;
    } catch (error) {
      return false;
    }
  }

  Future<List<t.Team>> getTeams() async {
    List<t.Team> teams = [];
    try {
      final raw =
          await http.get(Uri.parse('${_baseUrl}teams'), headers: _headers);
      if (raw.statusCode == 200) {
        teams = t.teamFromJson(raw.body);
      }
      return teams;
    } catch (error) {
      return teams;
    }
  }

  Future<List<b.Board>> getBoards() async {
    List<b.Board> boards = [];
    try {
      final raw = await http.get(Uri.parse('${_baseUrl}boards/full'),
          headers: _headers);
      if (raw.statusCode == 200) {
        boards = b.boardFromJson(raw.body);
      }
      return boards;
    } catch (error) {
      return boards;
    }
  }

  Future<List<MatchResult>> getMatches() async {
    List<MatchResult> matches = [];
    final raw =
        await http.get(Uri.parse('${_baseUrl}matches'), headers: _headers);
    if (raw.statusCode == 200) {
      matches = matchResultFromJson(raw.body);
    }
    return matches;
  }

  Future<bool> updateMatch(int score1, int score2) async {
    try {
      return true;
    } catch (error) {
      return false;
    }
  }
}
