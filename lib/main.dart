import 'package:bloc_tutorial/bloc/task_bloc.dart';
import 'package:bloc_tutorial/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
