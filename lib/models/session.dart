class Session {
  int id;
  String name;
  Session({
    required this.id,
    required this.name,
  });

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

final sessions = [
  Session(id: 1, name: "Session 1"),
  Session(id: 2, name: "Session 2"),
  Session(id: 3, name: "Session 3"),
  Session(id: 4, name: "Session 4"),
  Session(id: 5, name: "Session 5"),
  Session(id: 6, name: "Session 6"),
  Session(id: 7, name: "Session 7"),
  Session(id: 8, name: "Session 8"),
  Session(id: 9, name: "Session 9"),
];
