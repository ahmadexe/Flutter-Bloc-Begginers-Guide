import 'package:bloc_tutorial/models/task.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  const TaskTile({required this.task,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(task.title),
          subtitle: Text(task.description),
        ),
        const Divider()
      ],
    );
  }
}