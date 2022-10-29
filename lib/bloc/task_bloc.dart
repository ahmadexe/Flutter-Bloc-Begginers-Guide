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
    on<DeleteTask>((event, emit) {
      emit(TaskState(tasks: state.tasks..remove(event.task))); 
    });
    on<UpdateTask>(_updateTask);
  }

  _updateTask(UpdateTask event, Emitter<TaskState> emit) {
    final state = this.state;
    bool updateTitle = event.name != null;
    bool updateDescription = event.description != null;
    
    if (updateTitle) {
      state.tasks[event.index].title = event.name!;
    }

    if (updateDescription) {
      state.tasks[event.index].description = event.description!;
    }
  }
}
