import 'package:flutter/material.dart';
import 'package:tournament/models/result.dart';

class UpdateResultScreen extends StatefulWidget {
  Result result;

  UpdateResultScreen(this.result);

  @override
  _UpdateResultScreenState createState() => _UpdateResultScreenState();
}

class _UpdateResultScreenState extends State<UpdateResultScreen> {
  var controller1;
  var controller2;

  @override
  void initState() {
    controller1 = TextEditingController(text: widget.result.scoreTeam1.toString());
    controller2 = TextEditingController(text: widget.result.scoreTeam2.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(widget.result.team1.name),
          Row(
            children: [
              TextField(
                decoration: InputDecoration(hintText: '0'),
                controller: controller1,
              ),
              Text('-'),
              TextField(
                decoration: InputDecoration(hintText: '0'),
                controller: controller2,
              ),
            ],
          ),
          Text(widget.result.team2.name),
          ElevatedButton(onPressed: () {}, child: Text('Cập nhật'))
        ],
      ),
    );
  }
}
