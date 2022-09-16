import 'package:bloc_tutorial/cubit/counter_cubit.dart';
import 'package:bloc_tutorial/screens/home_screen.dart';
import 'package:bloc_tutorial/screens/third_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("This is page 2"),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    child: const Icon(Icons.add)),
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    child: const Icon(Icons.remove))
              ],
            ),
            ElevatedButton(
                onPressed: () async {
                  await Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder:  (_) =>
                    const ThirdScreen()
                  ));
                },
                child: const Text("Go To third screen"))
          ],
        ),
      ),
    );
  }
}
