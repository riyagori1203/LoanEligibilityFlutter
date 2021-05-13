import 'package:flutter/material.dart'; 
import 'widgets.dart';
import 'const.dart';

class ChatWithUs extends StatefulWidget {
  @override
  _ChatWithUsState createState() => _ChatWithUsState();
}

class _ChatWithUsState extends State<ChatWithUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: appBarandButtonColor,
        title: Text('Chat With Us'),
      ),
      body: Container(
    ),);
  }
}
