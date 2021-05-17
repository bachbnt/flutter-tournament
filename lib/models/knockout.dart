// To parse this JSON data, do
//
//     final knockoutResult = knockoutResultFromJson(jsonString);

import 'dart:convert';

KnockoutResult knockoutResultFromJson(String str) =>
    KnockoutResult.fromJson(json.decode(str));

String knockoutResultToJson(KnockoutResult data) => json.encode(data.toJson());

class KnockoutResult {
  KnockoutResult({
    this.knockoutResultFinal,
    this.semifinal,
  });

  List<Final> knockoutResultFinal;
  List<Final> semifinal;

  factory KnockoutResult.fromJson(Map<String, dynamic> json) => KnockoutResult(
        knockoutResultFinal:
            List<Final>.from(json["final"].map((x) => Final.fromJson(x))),
        semifinal:
            List<Final>.from(json["semifinal"].map((x) => Final.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "final": List<dynamic>.from(knockoutResultFinal.map((x) => x.toJson())),
        "semifinal": List<dynamic>.from(semifinal.map((x) => x.toJson())),
      };
}

class Final {
  Final({
    this.isTeam1Winner,
    this.isTeam2Winner,
    this.level,
    this.id,
    this.v,
    this.createdAt,
    this.team1,
    this.team2,
    this.updatedAt,
    this.finalId,
    this.match,
  });

  bool isTeam1Winner;
  bool isTeam2Winner;
  int level;
  String id;
  int v;
  DateTime createdAt;
  Team1 team1;
  Team1 team2;
  DateTime updatedAt;
  String finalId;
  Match match;

  factory Final.fromJson(Map<String, dynamic> json) => Final(
        isTeam1Winner: json["isTeam1Winner"],
        isTeam2Winner: json["isTeam2Winner"],
        level: json["level"],
        id: json["_id"],
        v: json["__v"],
        createdAt: DateTime.parse(json["createdAt"]),
        team1: Team1.fromJson(json["team1"]),
        team2: Team1.fromJson(json["team2"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        finalId: json["id"],
        match: json["match"] == null ? null : Match.fromJson(json["match"]),
      );

  Map<String, dynamic> toJson() => {
        "isTeam1Winner": isTeam1Winner,
        "isTeam2Winner": isTeam2Winner,
        "level": level,
        "_id": id,
        "__v": v,
        "createdAt": createdAt.toIso8601String(),
        "team1": team1.toJson(),
        "team2": team2.toJson(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": finalId,
        "match": match == null ? null : match.toJson(),
      };
}

class Match {
  Match({
    this.team1Score,
    this.team2Score,
    this.status,
    this.id,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.matchId,
  });

  int team1Score;
  int team2Score;
  dynamic status;
  String id;
  DateTime publishedAt;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String matchId;

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        team1Score: json["team1Score"],
        team2Score: json["team2Score"],
        status: json["status"],
        id: json["_id"],
        publishedAt: DateTime.parse(json["published_at"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        matchId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "team1Score": team1Score,
        "team2Score": team2Score,
        "status": status,
        "_id": id,
        "published_at": publishedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "id": matchId,
      };
}

class Team1 {
  Team1({
    this.id,
    this.name,
    this.slug,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.board,
    this.team1Id,
    this.owner,
  });

  String id;
  String name;
  String slug;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String board;
  String team1Id;
  String owner;

  factory Team1.fromJson(Map<String, dynamic> json) => Team1(
        id: json["_id"],
        name: json["name"],
        slug: json["slug"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        board: json["board"] == null ? null : json["board"],
        team1Id: json["id"],
        owner: json["owner"] == null ? null : json["owner"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "slug": slug,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "board": board == null ? null : board,
        "id": team1Id,
        "owner": owner == null ? null : owner,
      };
}
