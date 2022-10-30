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

class UpdateTask implements TaskEvent {
  Task task;
  int index;
  UpdateTask({
    required this.index,
    required this.task,
  });
}

class ToggleDone implements TaskEvent {
  int index;
  ToggleDone({
    required this.index,
  });
}
