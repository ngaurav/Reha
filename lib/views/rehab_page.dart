import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RehabPage extends StatelessWidget {
  const RehabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rehab Programme',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
            fontSize: 25,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("img/knee.png"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
