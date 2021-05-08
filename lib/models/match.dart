// To parse this JSON data, do
//
//     final matchRes = matchResFromJson(jsonString);

import 'dart:convert';

List<MatchResult> matchResultFromJson(String str) => List<MatchResult>.from(
    json.decode(str).map((x) => MatchResult.fromJson(x)));

String matchResultToJson(List<MatchResult> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MatchResult {
  MatchResult({
    this.createdAt,
    this.updatedAt,
    this.board,
    this.team1,
    this.team2,
    this.match,
    this.id,
  });

  DateTime createdAt;
  DateTime updatedAt;
  Board board;
  Team team1;
  Team team2;
  Match match;
  String id;

  factory MatchResult.fromJson(Map<String, dynamic> json) => MatchResult(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        board: Board.fromJson(json["board"]),
        team1: Team.fromJson(json["team1"]),
        team2: Team.fromJson(json["team2"]),
        match: Match.fromJson(json["match"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "board": board.toJson(),
        "team1": team1.toJson(),
        "team2": team2.toJson(),
        "match": match.toJson(),
        "id": id,
      };
}

class Board {
  Board({
    this.id,
    this.name,
    this.boardId,
  });

  String id;
  String name;
  String boardId;

  factory Board.fromJson(Map<String, dynamic> json) => Board(
        id: json["_id"],
        name: json["name"],
        boardId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "id": boardId,
      };
}

class Team {
  Team({
    this.id,
    this.name,
    this.teamId,
  });

  String id;
  String name;
  String teamId;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["_id"],
        name: json["name"],
        teamId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "id": teamId,
      };
}

class Match {
  Match({
    this.status,
    this.id,
    this.team1Score,
    this.team2Score,
    this.date,
    this.matchId,
  });

  String status;
  String id;
  int team1Score;
  int team2Score;
  DateTime date;
  String matchId;

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        status: json["status"],
        id: json["_id"],
        team1Score: json["team1Score"],
        team2Score: json["team2Score"],
        date: DateTime.parse(json["date"]),
        matchId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "_id": id,
        "team1Score": team1Score,
        "team2Score": team2Score,
        "date": date.toIso8601String(),
        "id": matchId,
      };
}
