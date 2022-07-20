import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rehab/models/session.dart';

import '../view_models/session_activity_vm.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SessionActivityVM());
    // var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Container(
            padding: const EdgeInsets.only(top: 5),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Good Morning',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      fontSize: 25),
                ),
                const Text(
                  'Jane',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      fontSize: 25),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        // color: Colors.grey[500],
        margin: const EdgeInsets.only(left: 40, right: 20, top: 60),
        child: ListView.builder(
          itemCount: sessions.length,
          itemBuilder: (context, index) => GetBuilder<SessionActivityVM>(
            // specify type as Controller
            init: SessionActivityVM(), // intialize with the Controller
            builder: (value) => Container(
              height: 150,
              child: Card(
                elevation: 8,
                child: ListTile(
                  // screenSize: screenSize,
                  title: Text(
                    sessions[index].name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(2),
                    child: Text(
                      value.lst.contains(sessions[index])
                          ? "Completed"
                          : "Start",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  // onTap: controller.lst.contains(sessions[index])
                  //     ? null
                  //     : () => controller.add(),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 80,
        width: 300,
        child: FloatingActionButton.extended(
          backgroundColor: Colors.blue[800],
          icon: Icon(Icons.play_arrow),
          label: Text(
            'Start Session',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () => controller.add(),
        ),
      ),
    );
  }
}
