import 'package:flutter/material.dart';
import 'package:tournament/api_service.dart';
import 'package:tournament/models/match.dart';

class UpdateResultScreen extends StatefulWidget {
  MatchResult matchResult;

  UpdateResultScreen(this.matchResult);

  @override
  _UpdateResultScreenState createState() => _UpdateResultScreenState();
}

class _UpdateResultScreenState extends State<UpdateResultScreen> {
  TextEditingController controller1;
  TextEditingController controller2;
  bool loading = false;

  @override
  void initState() {
    controller1 = TextEditingController(
        text: widget.matchResult.match.team1Score.toString());
    controller2 = TextEditingController(
        text: widget.matchResult.match.team2Score.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cập nhật kết quả'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Center(child: Text(widget.matchResult.team1.name))),
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextField(
                        decoration: InputDecoration(hintText: '0'),
                        controller: controller1,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Expanded(flex: 1, child: Center(child: Text(' - '))),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        decoration: InputDecoration(hintText: '0'),
                        controller: controller2,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Center(child: Text(widget.matchResult.team2.name))),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: ElevatedButton(
                onPressed: loading
                    ? null
                    : () async {
                        setState(() {
                          loading = true;
                        });
                        if (await ApiService().updateMatch(
                            widget.matchResult.id,
                            int.parse(controller1.text.trim()),
                            int.parse(controller2.text.trim()))) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Thành công')));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Thất bại')));
                        }
                        setState(() {
                          loading = false;
                        });
                      },
                child: Text('Cập nhật')),
          )
        ],
      ),
    );
  }
}
