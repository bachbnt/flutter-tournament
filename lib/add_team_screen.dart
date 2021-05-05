import 'package:flutter/material.dart';

class AddTeamScreen extends StatefulWidget {
  @override
  _AddTeamScreenState createState() => _AddTeamScreenState();
}

class _AddTeamScreenState extends State<AddTeamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text('Thêm đội'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Tên đội'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ElevatedButton(onPressed: () {}, child: Text('Thêm')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
