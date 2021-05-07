// To parse this JSON data, do
//
//     final signUpReq = signUpReqFromJson(jsonString);

import 'dart:convert';

SignUpReq signUpReqFromJson(String str) => SignUpReq.fromJson(json.decode(str));

String signUpReqToJson(SignUpReq data) => json.encode(data.toJson());

class SignUpReq {
  SignUpReq({
    this.username,
    this.email,
    this.password,
  });

  String username;
  String email;
  String password;

  factory SignUpReq.fromJson(Map<String, dynamic> json) => SignUpReq(
        username: json["username"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
      };
}

// To parse this JSON data, do
//
//     final signUpRes = signUpResFromJson(jsonString);

SignUpRes signUpResFromJson(String str) => SignUpRes.fromJson(json.decode(str));

String signUpResToJson(SignUpRes data) => json.encode(data.toJson());

class SignUpRes {
  SignUpRes({
    this.jwt,
    this.user,
  });

  String jwt;
  User user;

  factory SignUpRes.fromJson(Map<String, dynamic> json) => SignUpRes(
        jwt: json["jwt"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "jwt": jwt,
        "user": user.toJson(),
      };
}

class User {
  User({
    this.confirmed,
    this.blocked,
    this.id,
    this.username,
    this.email,
    this.provider,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.role,
    this.userId,
  });

  bool confirmed;
  bool blocked;
  String id;
  String username;
  String email;
  String provider;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  Role role;
  String userId;

  factory User.fromJson(Map<String, dynamic> json) => User(
        confirmed: json["confirmed"],
        blocked: json["blocked"],
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        provider: json["provider"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        role: Role.fromJson(json["role"]),
        userId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "confirmed": confirmed,
        "blocked": blocked,
        "_id": id,
        "username": username,
        "email": email,
        "provider": provider,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "role": role.toJson(),
        "id": userId,
      };
}

class Role {
  Role({
    this.id,
    this.name,
    this.description,
    this.type,
    this.v,
    this.roleId,
  });

  String id;
  String name;
  String description;
  String type;
  int v;
  String roleId;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        type: json["type"],
        v: json["__v"],
        roleId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "type": type,
        "__v": v,
        "id": roleId,
      };
}
