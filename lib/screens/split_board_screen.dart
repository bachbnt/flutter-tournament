import 'package:flutter/material.dart';
import 'package:tournament/api_service.dart';
import 'package:tournament/models/board.dart';

class SplitBoardScreen extends StatefulWidget {
  @override
  _SplitBoardScreenState createState() => _SplitBoardScreenState();
}

class _SplitBoardScreenState extends State<SplitBoardScreen> {
  Future<List<Board>> boards = ApiService().getBoards();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bảng đấu'),
        ),
        body: FutureBuilder<List<Board>>(
            future: boards,
            builder: (context, snapshot) {
              return Column(
                children: [
                  Expanded(
                    child: snapshot.hasData
                        ? ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 60,
                                      color: Colors.blue,
                                      child: Center(
                                        child: Text(
                                          snapshot.data[index].name,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount:
                                            snapshot.data[index].teams.length,
                                        itemBuilder: (context, i) => Container(
                                              height: 40,
                                              color: i % 2 == 0
                                                  ? Colors.white
                                                  : Colors.black26,
                                              child: Center(
                                                child: Text(snapshot
                                                    .data[index].teams[i].name),
                                              ),
                                            )),
                                  ],
                                ))
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                  )
                ],
              );
            }));
  }
}
