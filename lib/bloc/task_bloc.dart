import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/models/task.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {

  TaskBloc() : super(const TaskState()) {
    // hydrate();
    on<AddTask>(_addTask);
    on<DeleteTask>(_deleteTask);
    on<UpdateTask>(_updateTask);
    on<ToggleDone>(_toggleDone);
  }

  _addTask(AddTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(
      TaskState(
        tasks: List.from(state.tasks)..add(event.task)
      )
    );
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
    return TaskState.fromMap(json);
  }
  
  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toMap();
  }
}
