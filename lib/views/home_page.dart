import 'package:flutter/material.dart';
import 'package:rehab/models/session.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView.builder(
        itemCount: sessions.length,
        itemBuilder: (context, index) => ListTile(
          // screenSize: screenSize,
          title: Text(sessions[index].name),
        ),
      ),
    );
  }
}
