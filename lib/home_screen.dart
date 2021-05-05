import 'package:flutter/material.dart';
import 'package:tournament/add_team_screen.dart';
import 'package:tournament/result_screen.dart';
import 'package:tournament/split_board_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddTeamScreen()),
                  );
                },
                child: Text('Thêm đội')),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SplitBoardScreen()),
                    );
                  },
                  child: Text('Bảng đấu')),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResultScreen()),
                  );
                },
                child: Text('Kết quả')),
          ],
        ),
      ),
    );
  }
}
