import 'package:tournament/models/team.dart';

class Result {
  String id;
  Team team1;
  Team team2;
  int scoreTeam1;
  int scoreTeam2;

  Result(this.id, this.team1, this.team2, this.scoreTeam1, this.scoreTeam2);
}
