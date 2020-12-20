import 'package:flutter/material.dart';

class DeskTop extends StatefulWidget {
  @override
  _DeskTopState createState() => _DeskTopState();
}

class _DeskTopState extends State<DeskTop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
         Text("DeskTop")
            
          
        ],),
      ),
      
    );
  }
}