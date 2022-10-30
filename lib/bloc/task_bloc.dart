import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/models/task.dart';
import 'package:meta/meta.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {

  TaskBloc() : super(TaskState.init()) {
    on<AddTask>((event, emit) {
      emit(TaskState(tasks: state.tasks..add(event.task)));
    });
    on<DeleteTask>(_deleteTask);
    on<UpdateTask>(_updateTask);
    on<ToggleDone>(_toggleDone);
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
    bool updateTitle = event.name != null;
    bool updateDescription = event.description != null;    
    if (updateTitle) {
      allTasks[event.index].title = event.name!;
    }
    if (updateDescription) {
      allTasks[event.index].description = event.description!;
    }
    emit(TaskState(tasks: allTasks));
  }
}
