import 'package:flutter/material.dart'; 
import 'widgets.dart';
import 'const.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: appBarandButtonColor,
        title: Text('About Us'),
      ),
      body: Container(),
    );
  }
}
