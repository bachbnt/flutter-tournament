import 'package:tournament/models/result.dart';

class BoardResult {
  String id;
  String name;
  List<Result> results;

  BoardResult(this.id, this.name, this.results);
}
