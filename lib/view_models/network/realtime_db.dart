import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:rehab/models/session.dart';

class RealtimeDb {
  static Future<void> write({
    required List<Session> sessions,
  }) async {
    try {
      DatabaseReference databaseReference = FirebaseDatabase.instance
          .ref("sessions")
          .child(DateFormat('dd-MM-yyyy').format(DateTime.now()));
      await databaseReference.set(sessions.map((v) => v.toJson()).toList());
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Session>> read() async {
    try {
      DatabaseReference databaseReference =
          FirebaseDatabase.instance.ref("sessions");
      final snapshot = await databaseReference.get();
      if (snapshot.exists) {
        Map<String, dynamic> snapshotValue =
            Map<String, dynamic>.from(snapshot.value as Map);
        return snapshotValue[DateFormat('dd-MM-yyyy').format(DateTime.now())]
                .map((i) => Session.fromJson(i))
                .toList() ??
            [];
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }
}
