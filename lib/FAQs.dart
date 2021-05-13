import 'package:flutter/material.dart';
import 'widgets.dart';
import 'const.dart';

class FAQs extends StatefulWidget {
  @override
  _FAQsState createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarandButtonColor,
        title: Text('FAQs'),
      ),
      body: Container(),
    );
  }
}
