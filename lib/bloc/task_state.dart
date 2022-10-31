// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_bloc.dart';

class TaskState {
  final List<Task> tasks;
  
  const TaskState({
    this.tasks = const <Task>[],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tasks': tasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      tasks: List<Task>.from(map['tasks']?.map((x) => Task.fromMap(x))),
    );
  }
}
