class Task {
  late int id;
  String title;
  String description;
  DateTime date;

  Task(this.title, this.description, this.date);
  void fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    description = map['id'];
    date = map['date'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'nom': title,
      'description': description,
      'date': date
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
}
