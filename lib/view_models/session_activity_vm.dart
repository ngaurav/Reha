import 'package:get/get.dart';
import 'package:rehab/models/session.dart';

import 'network/realtime_db.dart';

class SessionActivityVM extends GetxController {
  List<Session> lst = [];

  @override
  onInit() async {
    super.onInit();
    try {
      lst = await RealtimeDb.read();
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
      await RealtimeDb.write(sessions: lst + [sessions[lst.length]]);
      lst.add(sessions[lst.length]);
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
