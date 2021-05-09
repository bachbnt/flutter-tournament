import 'package:flutter/material.dart';
import 'package:tournament/api_service.dart';
import 'package:tournament/models/match.dart';
import 'package:tournament/screens/update_result_screen.dart';

class ResultScreen extends StatefulWidget {
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Future<List<MatchResult>> matchResults = ApiService().getMatches();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Kết quả'),
          actions: [
            IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  setState(() {
                    matchResults = ApiService().getMatches();
                  });
                })
          ],
        ),
        body: FutureBuilder<List<MatchResult>>(
            future: matchResults,
            builder: (context, snapshot) {
              return Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    color: Colors.blue,
                    child: Center(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Center(
                              child: Text(
                                'Bảng',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Center(
                              child: Text(
                                'Đội 1',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Center(
                              child: Text(
                                'Tỉ số',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Center(
                              child: Text(
                                'Đội 2',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Center(
                              child: Text(
                                'Cập nhật kết quả',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: snapshot.hasData
                        ? ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, i) => Container(
                                  color: i % 2 == 0
                                      ? Colors.white
                                      : Colors.black26,
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Center(
                                            child: Text(
                                              snapshot.data[i].board.name,
                                              textAlign: TextAlign.center,
                                            ),
                                          )),
                                      Expanded(
                                          flex: 3,
                                          child: Center(
                                            child: Text(
                                              snapshot.data[i].team1.name,
                                              textAlign: TextAlign.center,
                                            ),
                                          )),
                                      Expanded(
                                        flex: 3,
                                        child: Center(
                                          child: Text(
                                            '${snapshot.data[i].match.team1Score} - ${snapshot.data[i].match.team2Score}',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 3,
                                          child: Center(
                                            child: Text(
                                              snapshot.data[i].team2.name,
                                              textAlign: TextAlign.center,
                                            ),
                                          )),
                                      Expanded(
                                        flex: 2,
                                        child: Center(
                                          child: IconButton(
                                            icon: Icon(Icons.edit),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        UpdateResultScreen(
                                                            snapshot.data[i])),
                                              ).then((value) => {
                                                    setState(() {
                                                      matchResults =
                                                          ApiService()
                                                              .getMatches();
                                                    })
                                                  });
                                            },
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ))
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                  ),
                ],
              );
            }));
  }
}
