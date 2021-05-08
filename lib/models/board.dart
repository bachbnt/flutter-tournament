// To parse this JSON data, do
//
//     final board = boardFromJson(jsonString);

import 'dart:convert';

List<Board> boardFromJson(String str) =>
    List<Board>.from(json.decode(str).map((x) => Board.fromJson(x)));

String boardToJson(List<Board> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Board {
  Board({
    this.name,
    this.createdAt,
    this.updatedAt,
    this.slug,
    this.teams,
    this.id,
  });

  String name;
  DateTime createdAt;
  DateTime updatedAt;
  String slug;
  List<Team> teams;
  String id;

  factory Board.fromJson(Map<String, dynamic> json) => Board(
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        slug: json["slug"],
        teams: List<Team>.from(json["teams"].map((x) => Team.fromJson(x))),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "slug": slug,
        "teams": List<dynamic>.from(teams.map((x) => x.toJson())),
        "id": id,
      };
}

class Team {
  Team({
    this.id,
    this.name,
    this.board,
    this.slug,
    this.teamId,
  });

  String id;
  String name;
  String board;
  String slug;
  String teamId;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["_id"],
        name: json["name"],
        board: json["board"],
        slug: json["slug"],
        teamId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "board": board,
        "slug": slug,
        "id": teamId,
      };
}

class Tournament {
  Tournament({
    this.name,
    this.slug,
    this.id,
  });

  String name;
  String slug;
  String id;

  factory Tournament.fromJson(Map<String, dynamic> json) => Tournament(
        name: json["name"],
        slug: json["slug"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "id": id,
      };
}
