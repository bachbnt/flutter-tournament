import 'package:flutter/material.dart';
import 'package:tournament/models/board_result.dart';
import 'package:tournament/update_result_screen.dart';

class ResultScreen extends StatefulWidget {
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  List<BoardResult> boardResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Kết quả'),
        ),
        body: ListView.builder(
            itemCount: boardResults.length,
            itemBuilder: (context, index) => ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) => Row(
                      children: [
                        Expanded(
                            child: Text(
                                boardResults[index].results[i].team1.name)),
                        Expanded(
                            child: Text(
                                '${boardResults[index].results[i].score1} - ${boardResults[index].results[i].score2}')),
                        Expanded(
                            child: Text(
                                boardResults[index].results[i].team2.name)),
                        IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UpdateResultScreen(
                                        boardResults[index].results[i])),
                              ).then((_) {});
                            })
                      ],
                    ))));
  }
}
