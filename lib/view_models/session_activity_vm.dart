import 'package:get/get.dart';
import 'package:rehab/models/session.dart';

import 'network/realtime_db.dart';

class SessionActivityVM extends GetxController {
  Map<DateTime, Session> lst = {};
  bool loaded = false;

  @override
  onInit() async {
    super.onInit();
    try {
      lst = await RealtimeDb.read();
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
