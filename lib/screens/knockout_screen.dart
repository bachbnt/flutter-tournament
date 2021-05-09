import 'package:flutter/material.dart';
import 'package:tournament/api_service.dart';
import 'package:tournament/models/knockout.dart';

class KnockoutScreen extends StatefulWidget {
  @override
  _KnockoutScreenState createState() => _KnockoutScreenState();
}

class _KnockoutScreenState extends State<KnockoutScreen> {
  Future<KnockoutResult> result = ApiService().getKnockoutMatches();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đấu loại'),
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () async {
                await ApiService().refreshKnockout();
                setState(() {
                  result = ApiService().getKnockoutMatches();
                });
              })
        ],
      ),
      body: FutureBuilder<KnockoutResult>(
          future: result,
          builder: (context, snapshot) {
            return Column(
              children: [
                Expanded(
                  child: snapshot.hasData
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Expanded(flex: 1, child: Container()),
                                Expanded(
                                    flex: 4,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Center(
                                              child: TextButton(
                                                child: Text(snapshot.data
                                                                .knockoutResultFinal.length ==
                                                            0 ||
                                                        (!snapshot
                                                                .data
                                                                .knockoutResultFinal[
                                                                    0]
                                                                .isTeam1Winner &&
                                                            !snapshot
                                                                .data
                                                                .knockoutResultFinal[
                                                                    0]
                                                                .isTeam2Winner)
                                                    ? 'Chưa có'
                                                    : (snapshot
                                                            .data
                                                            .knockoutResultFinal[
                                                                0]
                                                            .isTeam1Winner
                                                        ? snapshot
                                                            .data
                                                            .knockoutResultFinal[
                                                                0]
                                                            .team1
                                                            .name
                                                        : snapshot
                                                            .data
                                                            .knockoutResultFinal[
                                                                0]
                                                            .team2
                                                            .name)),
                                              ),
                                            ))
                                      ],
                                    ))
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Center(child: Text('Chung kết'))),
                                Expanded(
                                    flex: 4,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Center(
                                              child: TextButton(
                                                onPressed: snapshot
                                                                .data
                                                                .knockoutResultFinal
                                                                .length ==
                                                            0 ||
                                                        snapshot
                                                            .data
                                                            .knockoutResultFinal[
                                                                0]
                                                            .isTeam1Winner
                                                    ? null
                                                    : () async {
                                                        if (await ApiService()
                                                            .updateKnockout(snapshot
                                                                .data
                                                                .knockoutResultFinal[
                                                                    0]
                                                                .team1
                                                                ?.id)) {
                                                          setState(() {
                                                            result = ApiService()
                                                                .getKnockoutMatches();
                                                          });
                                                        }
                                                      },
                                                child: Text(snapshot
                                                            .data
                                                            .knockoutResultFinal
                                                            .length !=
                                                        0
                                                    ? '${snapshot.data.knockoutResultFinal[0].team1?.name}'
                                                    : 'Chưa có'),
                                              ),
                                            )),
                                        Expanded(
                                            flex: 1,
                                            child: Center(
                                              child: TextButton(
                                                onPressed: snapshot
                                                                .data
                                                                .knockoutResultFinal
                                                                .length ==
                                                            0 ||
                                                        snapshot
                                                            .data
                                                            .knockoutResultFinal[
                                                                0]
                                                            .isTeam2Winner
                                                    ? null
                                                    : () async {
                                                        if (await ApiService()
                                                            .updateKnockout(snapshot
                                                                .data
                                                                .knockoutResultFinal[
                                                                    0]
                                                                .team2
                                                                ?.id)) {
                                                          setState(() {
                                                            result = ApiService()
                                                                .getKnockoutMatches();
                                                          });
                                                        }
                                                      },
                                                child: Text(snapshot
                                                            .data
                                                            .knockoutResultFinal
                                                            .length !=
                                                        0
                                                    ? '${snapshot.data.knockoutResultFinal[0].team2?.name}'
                                                    : 'Chưa có'),
                                              ),
                                            ))
                                      ],
                                    ))
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Center(child: Text('Bán kết'))),
                                Expanded(
                                    flex: 4,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Center(
                                              child: TextButton(
                                                onPressed: snapshot
                                                        .data
                                                        .semifinal[0]
                                                        .isTeam1Winner
                                                    ? null
                                                    : () async {
                                                        if (await ApiService()
                                                            .updateKnockout(
                                                                snapshot
                                                                    .data
                                                                    .semifinal[
                                                                        0]
                                                                    .team1
                                                                    ?.id)) {
                                                          setState(() {
                                                            result = ApiService()
                                                                .getKnockoutMatches();
                                                          });
                                                        }
                                                      },
                                                child: Text(
                                                    '${snapshot.data.semifinal[0].team1.name}'),
                                              ),
                                            )),
                                        Expanded(
                                            flex: 1,
                                            child: Center(
                                              child: TextButton(
                                                onPressed: snapshot
                                                        .data
                                                        .semifinal[0]
                                                        .isTeam2Winner
                                                    ? null
                                                    : () async {
                                                        if (await ApiService()
                                                            .updateKnockout(
                                                                snapshot
                                                                    .data
                                                                    .semifinal[
                                                                        0]
                                                                    .team2
                                                                    ?.id)) {
                                                          setState(() {
                                                            result = ApiService()
                                                                .getKnockoutMatches();
                                                          });
                                                        }
                                                      },
                                                child: Text(
                                                    '${snapshot.data.semifinal[0].team2?.name}'),
                                              ),
                                            )),
                                        Expanded(
                                            flex: 1,
                                            child: Center(
                                              child: TextButton(
                                                onPressed: snapshot
                                                        .data
                                                        .semifinal[1]
                                                        .isTeam1Winner
                                                    ? null
                                                    : () async {
                                                        if (await ApiService()
                                                            .updateKnockout(
                                                                snapshot
                                                                    .data
                                                                    .semifinal[
                                                                        1]
                                                                    .team1
                                                                    ?.id)) {
                                                          setState(() {
                                                            result = ApiService()
                                                                .getKnockoutMatches();
                                                          });
                                                        }
                                                      },
                                                child: Text(
                                                    '${snapshot.data.semifinal[1].team1?.name}'),
                                              ),
                                            )),
                                        Expanded(
                                            flex: 1,
                                            child: Center(
                                              child: TextButton(
                                                onPressed: snapshot
                                                        .data
                                                        .semifinal[1]
                                                        .isTeam2Winner
                                                    ? null
                                                    : () async {
                                                        if (await ApiService()
                                                            .updateKnockout(
                                                                snapshot
                                                                    .data
                                                                    .semifinal[
                                                                        1]
                                                                    .team2
                                                                    ?.id)) {
                                                          setState(() {
                                                            result = ApiService()
                                                                .getKnockoutMatches();
                                                          });
                                                        }
                                                      },
                                                child: Text(
                                                    '${snapshot.data.semifinal[1].team2?.name}'),
                                              ),
                                            ))
                                      ],
                                    ))
                              ],
                            ),
                          ],
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        ),
                ),
              ],
            );
          }),
    );
  }
}
