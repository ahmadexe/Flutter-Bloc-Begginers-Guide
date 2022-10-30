// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_bloc.dart';

class TaskState {
  List<Task> tasks;
  
  TaskState({required this.tasks});

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'tasks': tasks.map((x) => x.toMap()).toList(),
  //   };
  // }

  // factory TaskState.fromMap(Map<String, dynamic> map) {
  //   return TaskState(
  //     tasks: List<Task>.from((map['tasks'] as List<int>).map<Task>((x) => Task.fromMap(x as Map<String,dynamic>),),),
  //   );
  // }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tasks': tasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    print("Check here");
    return TaskState(
      tasks: List<Task>.from((map['tasks'] as List<Task>).map<Task>((x) => Task.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskState.fromJson(String source) => TaskState.fromMap(json.decode(source) as Map<String, dynamic>);
}
