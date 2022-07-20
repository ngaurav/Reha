// import 'package:equatable/equatable.dart';
import 'package:equatable/equatable.dart';

class Session extends Equatable {
  final int id;
  final String name;
  const Session({
    required this.id,
    required this.name,
  });

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      id: json['id'],
      name: 'name',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }

  @override
  List<Object?> get props => [id];
}

final sessions = [
  const Session(id: 1, name: "Session 1"),
  const Session(id: 2, name: "Session 2"),
  const Session(id: 3, name: "Session 3"),
  const Session(id: 4, name: "Session 4"),
  const Session(id: 5, name: "Session 5"),
  const Session(id: 6, name: "Session 6"),
  const Session(id: 7, name: "Session 7"),
  const Session(id: 8, name: "Session 8"),
  const Session(id: 9, name: "Session 9"),
  const Session(id: 10, name: "Session 10"),
  const Session(id: 11, name: "Session 11"),
  const Session(id: 12, name: "Session 12"),
  const Session(id: 13, name: "Session 13"),
  const Session(id: 14, name: "Session 14"),
  const Session(id: 15, name: "Session 15"),
  const Session(id: 16, name: "Session 16"),
  const Session(id: 17, name: "Session 17"),
  const Session(id: 18, name: "Session 18"),
  const Session(id: 19, name: "Session 19"),
];
