import 'package:bloc_tutorial/bloc/task_bloc.dart';
import 'package:bloc_tutorial/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateScreen extends StatefulWidget {
  final int index;
  UpdateScreen({required this.index, super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  TextEditingController _titleController = TextEditingController();

  TextEditingController _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text(
          "Update Task!",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                    label: Text("Title"), border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(
                    label: Text("Description"), border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Task task = Task(
                        title: _titleController.text,
                        description: _descController.text,
                        isDone:
                            context.read<TaskBloc>().state.tasks[widget.index].isDone);
                    context
                        .read<TaskBloc>()
                        .add(UpdateTask(index: widget.index, task: task));
                  },
                  child: const Text("Update!"))
            ],
          ),
        ),
      ),
    );
  }
}
