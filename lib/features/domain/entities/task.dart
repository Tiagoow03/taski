class Task {
  final int? id;
  final String title;
  final String description;
  final String date;
  final bool isDone;

  Task({
    this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.isDone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'isDone': isDone ? 1 : 0,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      date: map['date'],
      isDone: map['isDone'] == 1,
    );
  }
}
