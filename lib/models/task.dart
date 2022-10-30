// ignore_for_file: public_member_api_docs, sort_constructors_first
class Task {
  String? title;
  String? description;
  bool isDone;
  Task({
    required this.title,
    required this.description,
    required this.isDone
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'isDone': isDone,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] as String,
      description: map['description'] as String,
      isDone: map['isDone'] as bool,
    );
  }

  bool isEqual(Task task) {
    return this.title == task.title && this.description == task.description && this.isDone == task.isDone;
  }
}
