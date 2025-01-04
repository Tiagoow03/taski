class Task {
  int? id;
  String? title;
  String? description;
  String? date;
  bool? isDone;

  Task({
    this.id,
    this.title,
    this.description,
    this.date,
    this.isDone,
  });

  Task.empty() {
    id = 0;
    title = '';
    description = '';
    date = '';
    isDone = false;
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
    );
  }
}
