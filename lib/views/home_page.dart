import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      body: ListView.builder(
        itemCount: sessions.length,
        itemBuilder: (context, index) => GetBuilder<SessionActivityVM>(
          init: SessionActivityVM(),
          builder: (value) => !value.loaded
              ? const SizedBox(
                  height: 0,
                )
              : GestureDetector(
                  onTap: controller.lst.values.contains(sessions[index])
                      ? null
                      : () => controller.add(),
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CardContent(
                          session: sessions[index],
                          done: controller.lst.values.contains(sessions[index]),
                          current:
                              controller.lst.values.last == sessions[index],
                        ),
                        const Icon(
                          Icons.play_arrow_rounded,
                          size: 200,
                        ),
                      ],
                    ),
                  ),
                ),
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
  const CardContent({
    Key? key,
    required this.done,
    required this.current,
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
        if (current || !done)
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(Dimens.marginXS),
                decoration: const BoxDecoration(
                  borderRadius: Dimens.largeBorder,
                  color: Colors.blue,
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
              ),
            ],
          ),
      ],
    );
  }
}

class Pill extends StatelessWidget {
  final String text;
  final bool done;
  final bool current;

  const Pill({
    Key? key,
    required this.text,
    required this.done,
    required this.current,
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
