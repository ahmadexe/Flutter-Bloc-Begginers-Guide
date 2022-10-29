import 'dart:developer';

import 'package:bloc_tutorial/cubit/bulb_cubit.dart';
import 'package:bloc_tutorial/cubit/counter_cubit.dart';
import 'package:bloc_tutorial/screens/second_screen.dart';
import 'package:bloc_tutorial/try.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<BulbCubit, BulbState>(
      listener: (context, state) {
        if (state.isOn) {
          BlocProvider.of<CounterCubit>(context).increment();
        } else {
          BlocProvider.of<CounterCubit>(context).decrement();
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("This is page 1"),
              const Text(
                "This is the current counter",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 8,
              ),
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  if (state.myBoolean) {
                    if (kDebugMode) {
                      print('My boolean is true hence this is executed');
                    }
                  } else {
                    if (kDebugMode) {
                      print('My boolean is false hence this is executed');
                    }
                  }
                },
                builder: (context, state) {
                  return Text(state.counterValue.toString(),
                      style: const TextStyle(fontSize: 20));
                },
              ),
              BlocBuilder<BulbCubit, BulbState>(builder: (context, state) {
                if (state.isOn) {
                  return ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<BulbCubit>(context).off();
                      },
                      child: Text("Off!"));
                } else {
                  return ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<BulbCubit>(context).on();
                      },
                      child: Text("On!"));
                }
              }),
              ElevatedButton(
                  onPressed: () {
                    Nav(context, SecondScreen());
                  },
                  child: const Text("Get to Screen 2")),
            ],
          ),
        ),
      ),
    );
  }
}
