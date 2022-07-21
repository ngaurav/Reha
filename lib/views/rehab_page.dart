import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rehab/models/session.dart';
import 'package:rehab/themes/app_size.dart';
import 'package:rehab/themes/app_theme.dart';
import 'package:rehab/views/widgets/banner_view.dart';

import '../view_models/session_activity_vm.dart';

class RehabPage extends StatelessWidget {
  const RehabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        //   child: GetBuilder<SessionActivityVM>(
        //       init: SessionActivityVM(),
        //       builder: (value) {
        //         var keys = value.lst.keys.toList();
        //         return ListView.builder(
        //             itemCount: keys.length,
        //             itemBuilder: (context, index) {
        //               return ListTile(
        //                 title: Text(value.lst[keys[index]]!.name),
        //                 subtitle: Text(DateFormat('h:mm a').format(keys[index])),
        //               );
        //             });
        //       }),
        // ));
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: Dimens.marginXL,
                  top: Dimens.marginXL,
                  bottom: Dimens.marginM),
              child: Text(
                "Rehab Programme",
                style: AppTheme.textTheme.headline2,
              ),
            ),
            const BannerView(picture: "assets/image_01.png"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: Dimens.marginXL,
                      top: Dimens.marginL,
                      bottom: Dimens.marginM),
                  child: Text(
                    "History",
                    style: AppTheme.textTheme.headline3,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimens.marginXL),
                  child: IconButton(
                    icon: Icon(
                      Icons.filter_alt,
                      size: Dimens.iconSize,
                    ),
                    onPressed: null,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimens.marginXL,
                vertical: Dimens.marginS,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: Dimens.border,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(Dimens.marginS),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Total Sessions",
                            style: AppTheme.textTheme.caption,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.fitness_center,
                              ),
                              Text(
                                "16",
                                style: AppTheme.textTheme.subtitle1,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(Dimens.marginS),
                        child: Container(
                          width: 2,
                          height: Dimens.iconSize,
                          color: Colors.black54,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Total Time",
                            style: AppTheme.textTheme.caption,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.timelapse,
                              ),
                              Text(
                                "16",
                                style: AppTheme.textTheme.subtitle1,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GetBuilder<SessionActivityVM>(
                  init: SessionActivityVM(),
                  builder: (value) {
                    var keys = value.lst.keys.toList();
                    return ListView.builder(
                        itemCount: keys.length,
                        itemBuilder: (context, index) {
                          return TableRow(
                            session: value.lst[keys[index]]!,
                            date: keys[index],
                          );
                        });
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class TableRow extends StatelessWidget {
  final Session session;
  final DateTime date;
  const TableRow({
    Key? key,
    required this.session,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.marginXL,
        vertical: Dimens.marginS,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: Colors.grey)),
                child: Icon(
                  Icons.hiking,
                  color: Colors.green,
                  size: 45,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  const Icon(
                    Icons.punch_clock_outlined,
                  ),
                  const Icon(
                    Icons.calendar_month,
                  ),
                ],
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                children: [
                  Text(DateFormat('h:mm a').format(date)),
                  SizedBox(
                    height: 5,
                  ),
                  Text(DateFormat('dd-MM-yyyy').format(date))
                ],
              ),
            ],
          ),
          Text("View Results")
        ],
      ),
    );
  }
}
