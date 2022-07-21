import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rehab/models/session.dart';

import 'network/realtime_db.dart';

class SessionActivityVM extends GetxController {
  Map<DateTime, Session> lst = {};
  Map<Session, DateTime> rev = {};
  bool loaded = false;

  @override
  onInit() async {
    super.onInit();
    try {
      lst = await RealtimeDb.read();

      lst.forEach((key, values) {
        if (DateFormat("dd-MM-yyyy").format(key) ==
            DateFormat("dd-MM-yyyy").format(DateTime.now())) rev[values] = key;
      });
      loaded = true;
      update();
    } on Exception catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: "$e",
        duration: const Duration(milliseconds: 3000),
      ));
    }
  }

  add() async {
    try {
      var t =
          await RealtimeDb.write(sessions: lst, session: sessions[lst.length]);
      lst[t] = sessions[lst.length];
      lst.forEach((key, values) {
        if (DateFormat("dd-MM-yyyy").format(key) ==
            DateFormat("dd-MM-yyyy").format(DateTime.now())) rev[values] = key;
      });
      update();
    } on Exception catch (e) {
      Get.showSnackbar(GetSnackBar(
        message: "$e",
        duration: const Duration(milliseconds: 3000),
      ));
    }
  }

  // del(int index) {
  //   lst.removeAt(index);
  //   update();
  // }
}
