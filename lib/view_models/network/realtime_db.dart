import 'dart:convert';

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
        Map<String, dynamic> data = jsonDecode(jsonEncode(snapshot.value));

        Map<DateTime, Session> ret = {};
        data.forEach((key, values) {
          values.forEach((key1, values1) {
            ret[DateTime.fromMicrosecondsSinceEpoch(int.parse(key1))] =
                Session.fromJson(values1);
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
