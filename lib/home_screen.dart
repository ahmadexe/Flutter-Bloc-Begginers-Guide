import 'package:bloc_tutorial/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          children: [
            BlocConsumer<CounterBloc, CounterState>(
              listener: (context, state) {
                
              },
              builder: (context, state) {
                return Text(state.counter.toString());
              },
            ),

            Row(
              children: [
                ElevatedButton(onPressed: (){
                  context.read<CounterBloc>().add(Increment());
                }, child: const Icon(Icons.remove)),
                ElevatedButton(onPressed: (){
                  context.read<CounterBloc>().add(Decrement());
                }, child: const Icon(Icons.add))
              ],
            )

          ],
        )
      ),
    );
  }
}