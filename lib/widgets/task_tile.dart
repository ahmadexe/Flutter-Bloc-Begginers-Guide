import 'package:bloc_tutorial/bloc/task_bloc.dart';
import 'package:bloc_tutorial/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final int index;
  const TaskTile({required this.index,required this.task,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onDoubleTap: () {
            context.read<TaskBloc>().add(DeleteTask(task: task));
          },
          child: ListTile(
            title: Text(task.title),
            subtitle: Text(task.description),
            trailing: Checkbox(value: task.isDone, onChanged: (value){
              context.read<TaskBloc>().add(ToggleDone(index: index));
            }),
          ),
        ),
        const Divider()
      ],
    );
  }
}