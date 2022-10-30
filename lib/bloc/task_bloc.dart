import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/models/task.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {

  TaskBloc() : super(TaskState(tasks: [])) {
    // hydrate();
    on<AddTask>(_addTask);
    on<DeleteTask>(_deleteTask);
    on<UpdateTask>(_updateTask);
    on<ToggleDone>(_toggleDone);
  }

  _addTask(AddTask event, Emitter<TaskState> emit) {
    var state = this.state;
    var tasks = state.tasks;
    tasks.add(event.task);
    emit(TaskState(tasks: tasks));
  }

  _toggleDone(ToggleDone event, Emitter<TaskState> emit) {
    var state = this.state;
    var tasks = state.tasks;
    tasks[event.index].isDone = !tasks[event.index].isDone;
    emit(TaskState(tasks: tasks));
  }

  _deleteTask(DeleteTask event, Emitter<TaskState> emit) {
    final state = this.state;
    var tasks = state.tasks;
    for (int i = 0; i < tasks.length; i++) {
      if (tasks[i].isEqual(event.task)) {
        tasks.removeAt(i);
        break;
      }
    }
    emit(TaskState(tasks: tasks));
  }

  _updateTask(UpdateTask event, Emitter<TaskState> emit) {
    final state = this.state;
    var allTasks = state.tasks;
    bool updateTitle = event.task.title != null;
    bool updateDescription = event.task.description != null;    
    if (updateTitle) {
      allTasks[event.index].title = event.task.title;
    }
    if (updateDescription) {
      allTasks[event.index].description = event.task.description;
    }
    emit(TaskState(tasks: allTasks));
  }
  
  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    if (kDebugMode) {
      print("Reached");
    }
    if (kDebugMode) {
      print(json);
    }
    return TaskState(tasks: json['tasks'] as List<Task>);
  }
  
  @override
  Map<String, dynamic>? toJson(TaskState state) {
    if (kDebugMode) {
      print("2 ${state.toMap()}");
    }
    
    return state.toMap();
    // return {'tasks':[{'title':'gcc','description':'abc','isDone':false}]};
  }
}
