// To parse this JSON data, do
//
//     final matchResult = matchResultFromJson(jsonString);

import 'dart:convert';

List<MatchResult> matchResultFromJson(String str) => List<MatchResult>.from(
    json.decode(str).map((x) => MatchResult.fromJson(x)));

String matchResultToJson(List<MatchResult> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MatchResult {
  MatchResult({
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
    this.board,
    this.match,
    this.team1,
    this.team2,
    this.id,
  });

  DateTime publishedAt;
  DateTime createdAt;
  DateTime updatedAt;
  Board board;
  Match match;
  Team team1;
  Team team2;
  String id;

  factory MatchResult.fromJson(Map<String, dynamic> json) => MatchResult(
        publishedAt: DateTime.parse(json["published_at"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        board: Board.fromJson(json["board"]),
        match: Match.fromJson(json["match"]),
        team1: Team.fromJson(json["team1"]),
        team2: Team.fromJson(json["team2"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "published_at": publishedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "board": board.toJson(),
        "match": match.toJson(),
        "team1": team1.toJson(),
        "team2": team2.toJson(),
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
    this.boardId,
  });

  String id;
  String name;
  String boardId;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
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

class Match {
  Match({
    this.team1Score,
    this.team2Score,
    this.status,
    this.id,
    this.matchId,
  });

  int team1Score;
  int team2Score;
  dynamic status;
  String id;
  String matchId;

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        team1Score: json["team1Score"],
        team2Score: json["team2Score"],
        status: json["status"],
        id: json["_id"],
        matchId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "team1Score": team1Score,
        "team2Score": team2Score,
        "status": status,
        "_id": id,
        "id": matchId,
      };
}
