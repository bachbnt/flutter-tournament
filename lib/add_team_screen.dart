import 'package:flutter/material.dart';
import 'package:tournament/models/team.dart';

class AddTeamScreen extends StatefulWidget {
  @override
  _AddTeamScreenState createState() => _AddTeamScreenState();
}

class _AddTeamScreenState extends State<AddTeamScreen> {
  List<Team> teams = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm đội'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(labelText: 'Tên đội'),
                ),
              ),
              ElevatedButton(onPressed: () {}, child: Text('Thêm đội'))
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: teams.length,
                itemBuilder: (context, i) => Container(
                      child: Text(teams[i].name),
                    )),
          )
        ],
      ),
    );
  }
}
