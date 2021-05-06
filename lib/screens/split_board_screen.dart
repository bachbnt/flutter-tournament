import 'package:flutter/material.dart';
import 'package:tournament/models/board.dart';

class SplitBoardScreen extends StatefulWidget {
  @override
  _SplitBoardScreenState createState() => _SplitBoardScreenState();
}

class _SplitBoardScreenState extends State<SplitBoardScreen> {
  List<int> items = [2, 4, 8, 16];
  int selected;
  List<Board> boards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bảng đấu'),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DropdownButton<int>(
                    hint: Text('Số bảng'),
                    value: selected,
                    onChanged: (value) {
                      setState(() {
                        selected = value;
                      });
                    },
                    items: items
                        .map((e) => DropdownMenuItem<int>(
                            value: e, child: Text('${e}')))
                        .toList()),
                ElevatedButton(onPressed: () {}, child: Text('Chia bảng'))
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: boards.length,
                  itemBuilder: (context, index) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(boards[index].name),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: boards[index].teams.length,
                              itemBuilder: (context, i) => Container(
                                    child: Text(boards[index].teams[i].name),
                                  )),
                        ],
                      )),
            ),
          ],
        ));
  }
}
