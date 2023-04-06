import 'package:flutter/material.dart';

class Activity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('activity')),
      body: Center(
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}