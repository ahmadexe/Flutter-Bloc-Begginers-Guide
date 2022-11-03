import 'package:bloc_tutorial/bloc/task_bloc.dart';
import 'package:bloc_tutorial/models/task.dart';
import 'package:bloc_tutorial/screens/update_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskTile extends StatefulWidget {
  final Task task;
  final int index;
  const TaskTile({required this.index, required this.task, super.key});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onLongPress: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => UpdateScreen(index: widget.index)));
          },
          onDoubleTap: () {
            context.read<TaskBloc>().add(DeleteTask(task: widget.task));
          },
          child: ListTile(
            title: Text(widget.task.title!),
            subtitle: Text(widget.task.description!,
                style: TextStyle(
                    decoration: widget.task.isDone
                        ? TextDecoration.lineThrough
                        : null)),
            trailing: Checkbox(
                value: widget.task.isDone,
                onChanged: (value) {
                  context.read<TaskBloc>().add(ToggleDone(index: widget.index));
                }),
          ),
        ),
        const Divider()
      ],
    );
  }
}
