import 'dart:html';

import 'package:flutter/material.dart';
class MyHomepage extends StatefulWidget {
  const MyHomepage({ Key? key }) : super(key: key);

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter test'),
      ),
      body: Container(
        
      ),
    );
  }
}