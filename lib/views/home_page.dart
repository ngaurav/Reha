import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rehab/models/session.dart';
import 'package:rehab/themes/app_size.dart';
import 'package:rehab/themes/app_theme.dart';

import '../view_models/session_activity_vm.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SessionActivityVM());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Container(
                height: 100,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good Morning",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                    Text("Jane",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Today's Progress",
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 30,
                              ),
                            ),
                            GetBuilder<SessionActivityVM>(
                                init: SessionActivityVM(),
                                builder: (value) {
                                  return Text(
                                    "${(value.rev.length / sessions.length * 100).toStringAsFixed(2)} %",
                                    style: TextStyle(
                                        color: Colors.blue[800],
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  );
                                }),
                          ],
                        ),
                        GetBuilder<SessionActivityVM>(
                            init: SessionActivityVM(),
                            builder: (value) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: LinearProgressIndicator(
                                  minHeight: 8,
                                  value: value.rev.length / sessions.length,
                                  // value: controller.value,
                                  semanticsLabel: 'Linear progress indicator',
                                ),
                              );
                            }),
                        GetBuilder<SessionActivityVM>(
                            init: SessionActivityVM(),
                            builder: (value) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Builder(builder: (context) {
                                    return Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(5),
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.white)),
                                          child: Icon(
                                            Icons.check_box,
                                            color: Colors.green,
                                            size: 35,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Text("Completed"),
                                            Text(
                                              '${value.rev.length} Sessions',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  }),
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            border: Border.all(
                                                width: 1, color: Colors.white)),
                                        child: Icon(
                                          Icons.arrow_circle_right,
                                          color: Colors.blue,
                                          size: 35,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Pending'),
                                          Text(
                                            '${sessions.length - value.rev.length} Sessions',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: sessions.length,
                itemBuilder: (context, index) => GetBuilder<SessionActivityVM>(
                    init: SessionActivityVM(),
                    builder: (value) {
                      var clr = controller.lst.values.contains(sessions[index])
                          ? Colors.blue
                          : Colors.grey;
                      return !value.loaded
                          ? const SizedBox(
                              height: 0,
                            )
                          : Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 2,
                                      height: 75,
                                      color: index != 0
                                          ? clr
                                          : Theme.of(context).canvasColor,
                                    ),
                                    Icon(
                                      controller.lst.values
                                              .contains(sessions[index])
                                          ? Icons.check_circle
                                          : Icons.circle_outlined,
                                      color: clr,
                                    ),
                                    Container(
                                      width: 2,
                                      height: 75,
                                      color: index != sessions.length - 1
                                          ? (controller.lst.values.last ==
                                                  sessions[index]
                                              ? Colors.grey
                                              : clr)
                                          : Theme.of(context).canvasColor,
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: GetBuilder<SessionActivityVM>(
                                      init: SessionActivityVM(),
                                      builder: (value) {
                                        return GestureDetector(
                                          onTap: index != value.rev.length
                                              ? null
                                              : () => controller.add(),
                                          child: Card(
                                            elevation: index == value.rev.length
                                                ? 8.0
                                                : 1.0,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20.0, right: 5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  CardContent(
                                                    session: sessions[index],
                                                    done: controller.lst.values
                                                        .contains(
                                                            sessions[index]),
                                                    current: controller
                                                            .lst.values.last ==
                                                        sessions[index],
                                                    time: DateFormat('h:mm a')
                                                        .format(controller.rev[
                                                                sessions[
                                                                    index]] ??
                                                            DateTime.now()),
                                                    next: index ==
                                                        value.rev.length,
                                                  ),
                                                  Container(
                                                      margin: EdgeInsets.all(5),
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white54,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          border: Border.all(
                                                              width: 1,
                                                              color: Colors
                                                                  .green)),
                                                      // child: Icon(
                                                      //   Icons.hiking_outlined,
                                                      //   color: Colors.pink[100],
                                                      //   size: 100,
                                                      // ),
                                                      child: Image(
                                                        image: AssetImage(
                                                            "assets/exercise.jpg"),
                                                        height: 140,
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            );
                    }),
              ),
            ),
          ],
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
  final bool done;
  final bool current;
  final String time;
  final bool next;
  const CardContent({
    Key? key,
    required this.done,
    required this.current,
    required this.session,
    this.time = "",
    this.next = false,
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
        if (done)
          Pill(
            text: current ? "Performed" : "Completed",
            done: done,
            current: current,
          ),
        if (done)
          Text(
            current ? "Enter Pain Score" : "Performed at",
            style: Theme.of(context).textTheme.subtitle2,
          ),
        (current || !done)
            ? Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(Dimens.marginXS),
                    decoration: BoxDecoration(
                      borderRadius: Dimens.largeBorder,
                      color: next ? Colors.blue : Colors.grey,
                    ),
                    child: const Icon(
                      Icons.play_arrow_rounded,
                    ),
                  ),
                  const SizedBox(
                    width: Dimens.marginS,
                  ),
                  Pill(
                    text: current ? "Retry" : "Start",
                    done: false,
                    current: false,
                    next: next,
                  ),
                ],
              )
            : Text(
                time,
                style: Theme.of(context).textTheme.subtitle1,
              ),
      ],
    );
  }
}

class Pill extends StatelessWidget {
  final String text;
  final bool done;
  final bool current;
  final bool next;

  const Pill({
    Key? key,
    required this.text,
    required this.done,
    required this.current,
    this.next = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimens.marginM),
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimens.marginM, vertical: Dimens.marginS),
        decoration: BoxDecoration(
          borderRadius: Dimens.largeBorder,
          color: current
              ? Colors.amber
              : done
                  ? AppTheme.inactiveBlue
                  : next
                      ? Colors.blue
                      : Colors.grey,
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }
}
