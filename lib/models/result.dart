import 'package:tournament/models/team.dart';

class Result {
  String id;
  Team team1;
  Team team2;
  int score1;
  int score2;

  Result(this.id, this.team1, this.team2, this.score1, this.score2);
}
