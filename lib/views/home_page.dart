import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rehab/models/session.dart';
import 'package:rehab/themes/app_size.dart';

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
        itemBuilder: (context, index) => GetBuilder<SessionActivityVM>(
          // specify type as Controller
          init: SessionActivityVM(), // intialize with the Controller
          // builder: (value) => ListTile(
          //   // screenSize: screenSize,
          //   title: Text(sessions[index].name),
          //   subtitle: Text(
          //       value.lst.contains(sessions[index]) ? "completed" : "start"),
          //   onTap: controller.lst.contains(sessions[index])
          //       ? null
          //       : () => controller.add(),
          // ),
          builder: (value) => GestureDetector(
              onTap: controller.lst.contains(sessions[index])
                  ? null
                  : () => controller.add(),
              child: Card(
                child: Row(
                  children: [
                    CardContent(session: sessions[index]),
                    Icon(
                      Icons.play_arrow_rounded,
                      size: 200,
                    ),
                  ],
                ),
              )),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: 60,
        width: 300,
        child: FloatingActionButton.extended(
          backgroundColor: Colors.blue[800],
          icon: const Icon(
            Icons.play_arrow_rounded,
            size: Dimens.iconSize,
          ),
          label: Text(
            'Start Session',
            style: Theme.of(context)
                .textTheme
                .headline3
                ?.copyWith(color: Colors.white),
          ),
          onPressed: () => controller.add(),
        ),
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final Session session;
  const CardContent({
    Key? key,
    required this.session,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          session.name,
          style: Theme.of(context).textTheme.headline2,
        ),
        Text(
          "Mon/Thu/Sat",
          style: Theme.of(context).textTheme.subtitle2,
        ),
        Text(
          "3 sessions per day",
          style: Theme.of(context).textTheme.subtitle2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: Dimens.marginM),
          child: Container(
            padding: const EdgeInsets.all(Dimens.marginM),
            color: const Color.fromARGB(255, 216, 248, 135),
            child: Text(
              "Left Shoulder",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
        Text(
          "Assigned by",
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          "Jane Doe",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
