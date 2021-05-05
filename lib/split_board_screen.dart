import 'package:flutter/material.dart';

class SplitBoardScreen extends StatefulWidget {
  @override
  _SplitBoardScreenState createState() => _SplitBoardScreenState();
}

class _SplitBoardScreenState extends State<SplitBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
