// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class AddTask implements TaskEvent{
  Task task;
  AddTask({
    required this.task,
  });
}

class DeleteTask implements TaskEvent{
  Task task;
  DeleteTask({
    required this.task,
  });
}

class UpdateTask implements TaskEvent{
  String? name;
  int index;
  String? description;
  UpdateTask({
    required this.index,
    this.name,
    this.description,
  });
  
}
