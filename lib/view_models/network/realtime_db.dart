import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:rehab/models/session.dart';

class RealtimeDb {
  static Future<DateTime> write({
    required Map<DateTime, Session> sessions,
    required Session session,
  }) async {
    try {
      var t = DateTime.now();
      DatabaseReference databaseReference = FirebaseDatabase.instance
          .ref("sessions")
          .child(DateFormat('dd-MM-yyyy').format(t));

      // Map<int, dynamic> ret = {};
      // sessions.forEach((key, values) {
      //   if (DateFormat("dd-MM-yyyy").format(key) ==
      //       DateFormat("dd-MM-yyyy").format(DateTime.now())) {
      //     ret[key.microsecondsSinceEpoch] = values.toJson();
      //   }
      // });
      // ret[t.microsecondsSinceEpoch] = session.toJson();
      await databaseReference
          .child(t.microsecondsSinceEpoch.toString())
          .set(session.toJson());
      return t;
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<DateTime, Session>> read() async {
    try {
      DatabaseReference databaseReference =
          FirebaseDatabase.instance.ref("sessions");
      final snapshot = await databaseReference.get();
      if (snapshot.exists) {
        Map<String, dynamic> snapshotValue =
            Map<String, dynamic>.from(snapshot.value as Map);
        // final sessions =
        //     snapshotValue[DateFormat('dd-MM-yyyy').format(DateTime.now())] ??
        //         [];
        Map<DateTime, Session> ret = {};
        snapshotValue.forEach((key, values) {
          values.forEach((key, values) {
            ret[DateTime.fromMicrosecondsSinceEpoch(int.parse(key))] =
                Session.fromJson(values);
          });
        });
        return ret;
      } else {
        return {};
      }
    } catch (e) {
      rethrow;
    }
  }
}
