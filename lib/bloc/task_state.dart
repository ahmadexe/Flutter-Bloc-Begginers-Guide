part of 'task_bloc.dart';

class TaskState {
  late List<Task> tasks;
  
  TaskState({required this.tasks});
  
  TaskState.init() {
    tasks = <Task>[];
  }
}
