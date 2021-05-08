import 'package:flutter/material.dart';
import 'package:tournament/api_service.dart';
import 'package:tournament/models/team.dart';

class AddTeamScreen extends StatefulWidget {
  @override
  _AddTeamScreenState createState() => _AddTeamScreenState();
}

class _AddTeamScreenState extends State<AddTeamScreen> {
  final teamController = TextEditingController();
  bool loading = false;
  Future<List<Team>> teams = ApiService().getTeams();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thêm đội'),
      ),
      body: FutureBuilder<List<Team>>(
          future: teams,
          builder: (context, snapshot) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(labelText: 'Tên đội'),
                        controller: teamController,
                      ),
                    ),
                    Center(
                        child: ElevatedButton(
                            onPressed: loading
                                ? null
                                : () async {
                                    setState(() {
                                      loading = true;
                                    });
                                    if (await ApiService()
                                        .postTeam(teamController.text.trim())) {
                                      setState(() {
                                        teams = ApiService().getTeams();
                                        teamController.clear();
                                      });
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text('Thất bại')));
                                    }
                                    setState(() {
                                      loading = false;
                                    });
                                  },
                            child: Text('Thêm đội')))
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      'Danh sách đội',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: snapshot.hasData
                      ? ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, i) => Container(
                                height: 40,
                                color:
                                    i % 2 == 0 ? Colors.white : Colors.black26,
                                child: Row(
                                  children: [
                                    Text('${i + 1}'),
                                    Expanded(
                                        child: Center(
                                            child:
                                                Text(snapshot.data[i].name))),
                                  ],
                                ),
                              ))
                      : Center(
                          child: CircularProgressIndicator(),
                        ),
                )
              ],
            );
          }),
    );
  }
}
