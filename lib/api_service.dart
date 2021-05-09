import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tournament/models/board.dart' as b;
import 'package:tournament/models/knockout.dart';
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
    _headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
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
      print(error);
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
      print(error);
      return false;
    }
  }

  Future<bool> signOut() async {
    try {
      await PreferencesUtil.removeToken();
      await init();
      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }

  Future<bool> postTeam(String name) async {
    try {
      final raw = await http.post(Uri.parse('${_baseUrl}teams'),
          body: jsonEncode({'name': name}), headers: _headers);
      if (raw.statusCode == 200) {
        return true;
      }
      return false;
    } catch (error) {
      print(error);
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
      print(error);
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
      print(error);
      return boards;
    }
  }

  Future<List<MatchResult>> getMatches() async {
    List<MatchResult> matches = [];
    try {
      final raw = await http.get(Uri.parse('${_baseUrl}match-rounds'),
          headers: _headers);
      if (raw.statusCode == 200) {
        matches = matchResultFromJson(raw.body);
      }
      return matches;
    } catch (error) {
      print(error);
      return matches;
    }
  }

  Future<bool> updateMatch(String id, int score1, int score2) async {
    try {
      final raw = await http.put(Uri.parse('${_baseUrl}match-rounds/$id'),
          body: jsonEncode({'team1Score': score1, 'team2Score': score2}),
          headers: _headers);
      if (raw.statusCode == 200) {
        return true;
      }
      return false;
    } catch (error) {
      print(error);
      return false;
    }
  }

  Future<KnockoutResult> getKnockoutMatches() async {
    KnockoutResult res;
    try {
      final raw = await http.get(Uri.parse('${_baseUrl}match-knockouts/tree'),
          headers: _headers);
      if (raw.statusCode == 200) {
        res = knockoutResultFromJson(raw.body);
      }
      return res;
    } catch (error) {
      print(error);
      return res;
    }
  }

  Future<void> refreshKnockout() async {
    try {
      final raw = await http.post(
          Uri.parse('${_baseUrl}match-knockouts/refresh'),
          headers: _headers);
      if (raw.statusCode == 200) {
        return true;
      }
      return false;
    } catch (error) {
      print(error);
      return false;
    }
  }

  Future<bool> updateKnockout(String id) async {
    try {
      final raw = await http.put(Uri.parse('${_baseUrl}match-knockouts/$id'),
          headers: _headers);
      if (raw.statusCode == 200) {
        return true;
      }
      return false;
    } catch (error) {
      print(error);
      return false;
    }
  }
}
