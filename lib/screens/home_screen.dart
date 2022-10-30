import 'package:bloc_tutorial/bloc/task_bloc.dart';
import 'package:bloc_tutorial/models/task.dart';
import 'package:bloc_tutorial/widgets/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _addTaskController;
  late TextEditingController _addDescController;

  @override
  void initState() {
    _addTaskController = TextEditingController();
    _addDescController = TextEditingController();
    super.initState();
  }

  void _addTaskWidget(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Add Task!",
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _addTaskController,
                      decoration: const InputDecoration(
                          label: Text("Title"), border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _addDescController,
                      decoration: const InputDecoration(
                          label: Text("Description"),
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Cancel")),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Task task = Task(
                                  title: _addTaskController.text,
                                  description: _addDescController.text,
                                  isDone: false);
                              context.read<TaskBloc>().add(AddTask(task: task));
                            },
                            child: const Text("Add")),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTaskWidget(context),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Tasks"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              BlocBuilder<TaskBloc, TaskState>(
                builder: (context, state) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.tasks.length,
                    itemBuilder: (context, index) {
                      return TaskTile(task: state.tasks[index]);
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
