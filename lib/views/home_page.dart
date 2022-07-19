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
      body: ListView.builder(
        itemCount: sessions.length,
        itemBuilder: (context, index) => ListTile(
          // screenSize: screenSize,
          title: Text(sessions[index].name),
          subtitle: Text(
              controller.lst.contains(sessions[index]) ? "completed" : "start"),
          onTap: controller.lst.contains(sessions[index]) ? () => {} : null,
        ),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () => controller.add()),
    );
  }
}
