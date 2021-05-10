import 'package:flutter/material.dart';
import 'package:tournament/api_service.dart';
import 'package:tournament/models/knockout.dart';

class KnockoutScreen extends StatefulWidget {
  @override
  _KnockoutScreenState createState() => _KnockoutScreenState();
}

class _KnockoutScreenState extends State<KnockoutScreen> {
  Future<KnockoutResult> result = ApiService().getKnockoutMatches();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đấu loại'),
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () async {
                setState(() {
                  loading = true;
                });
                await ApiService().refreshKnockout();
                setState(() {
                  result = ApiService().getKnockoutMatches();
                });
                setState(() {
                  loading = false;
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
                  child: snapshot.hasData && !loading
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
                                                        setState(() {
                                                          loading = true;
                                                        });
                                                        if (await ApiService()
                                                            .updateKnockout(
                                                                snapshot
                                                                    .data
                                                                    .knockoutResultFinal[
                                                                        0]
                                                                    .id,
                                                                true,
                                                                false)) {
                                                          setState(() {
                                                            result = ApiService()
                                                                .getKnockoutMatches();
                                                          });
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(SnackBar(
                                                                  content: Text(
                                                                      'Thất bại')));
                                                        }
                                                        setState(() {
                                                          loading = false;
                                                        });
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
                                                        setState(() {
                                                          loading = true;
                                                        });
                                                        if (await ApiService()
                                                            .updateKnockout(
                                                                snapshot
                                                                    .data
                                                                    .knockoutResultFinal[
                                                                        0]
                                                                    .id,
                                                                false,
                                                                true)) {
                                                          setState(() {
                                                            result = ApiService()
                                                                .getKnockoutMatches();
                                                          });
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(SnackBar(
                                                                  content: Text(
                                                                      'Thất bại')));
                                                        }
                                                        setState(() {
                                                          loading = false;
                                                        });
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
                                                        setState(() {
                                                          loading = true;
                                                        });
                                                        if (await ApiService()
                                                            .updateKnockout(
                                                                snapshot
                                                                    .data
                                                                    .semifinal[
                                                                        0]
                                                                    .id,
                                                                true,
                                                                false)) {
                                                          setState(() {
                                                            result = ApiService()
                                                                .getKnockoutMatches();
                                                          });
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(SnackBar(
                                                                  content: Text(
                                                                      'Thất bại')));
                                                        }
                                                        setState(() {
                                                          loading = false;
                                                        });
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
                                                        setState(() {
                                                          loading = true;
                                                        });
                                                        if (await ApiService()
                                                            .updateKnockout(
                                                                snapshot
                                                                    .data
                                                                    .semifinal[
                                                                        0]
                                                                    .id,
                                                                false,
                                                                true)) {
                                                          setState(() {
                                                            result = ApiService()
                                                                .getKnockoutMatches();
                                                          });
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(SnackBar(
                                                                  content: Text(
                                                                      'Thất bại')));
                                                        }
                                                        setState(() {
                                                          loading = false;
                                                        });
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
                                                        setState(() {
                                                          loading = true;
                                                        });
                                                        if (await ApiService()
                                                            .updateKnockout(
                                                                snapshot
                                                                    .data
                                                                    .semifinal[
                                                                        1]
                                                                    .id,
                                                                true,
                                                                false)) {
                                                          setState(() {
                                                            result = ApiService()
                                                                .getKnockoutMatches();
                                                          });
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(SnackBar(
                                                                  content: Text(
                                                                      'Thất bại')));
                                                        }
                                                        setState(() {
                                                          loading = false;
                                                        });
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
                                                        setState(() {
                                                          loading = true;
                                                        });
                                                        if (await ApiService()
                                                            .updateKnockout(
                                                                snapshot
                                                                    .data
                                                                    .semifinal[
                                                                        1]
                                                                    .id,
                                                                false,
                                                                true)) {
                                                          setState(() {
                                                            result = ApiService()
                                                                .getKnockoutMatches();
                                                          });
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(SnackBar(
                                                                  content: Text(
                                                                      'Thất bại')));
                                                        }
                                                        setState(() {
                                                          loading = false;
                                                        });
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
