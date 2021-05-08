import 'package:flutter/material.dart';

class KnockoutScreen extends StatefulWidget {
  @override
  _KnockoutScreenState createState() => _KnockoutScreenState();
}

class _KnockoutScreenState extends State<KnockoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đấu loại'),
      ),
      body: FutureBuilder<dynamic>(builder: (context, snapshot) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(flex: 1, child: Center(child: Text('Chung kết'))),
                Expanded(
                    flex: 4,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Center(
                              child: TextButton(
                                child: Text('Đội 1'),
                              ),
                            ))
                      ],
                    ))
              ],
            ),
            Row(
              children: [
                Expanded(flex: 1, child: Center(child: Text('Bán kết'))),
                Expanded(
                    flex: 4,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Center(
                              child: TextButton(
                                child: Text('Đội 1'),
                              ),
                            )),
                        Expanded(
                            flex: 1,
                            child: Center(
                              child: TextButton(
                                child: Text('Đội 1'),
                              ),
                            ))
                      ],
                    ))
              ],
            ),
            Row(
              children: [
                Expanded(flex: 1, child: Center(child: Text('Tứ kết'))),
                Expanded(
                    flex: 4,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Center(
                              child: TextButton(
                                child: Text('Đội 1'),
                              ),
                            )),
                        Expanded(
                            flex: 1,
                            child: Center(
                              child: TextButton(
                                child: Text('Đội 1'),
                              ),
                            )),
                        Expanded(
                            flex: 1,
                            child: Center(
                              child: TextButton(
                                child: Text('Đội 1'),
                              ),
                            )),
                        Expanded(
                            flex: 1,
                            child: Center(
                              child: TextButton(
                                child: Text('Đội 1'),
                              ),
                            ))
                      ],
                    ))
              ],
            ),
          ],
        );
      }),
    );
  }
}
