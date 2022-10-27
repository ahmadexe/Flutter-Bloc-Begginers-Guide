import 'package:bloc_tutorial/bloc/counter_bloc.dart';
import 'package:bloc_tutorial/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () async {
                await Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => HomePage()));
              },
              icon: const Icon(Icons.arrow_back)),
          title: const Text("Second Screen"),
        ),
        body: Center(
          child: Column(
            children: [
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return Text(state.counter.toString());
                },
              ),
              Row(
              children: [
                ElevatedButton(onPressed: (){
                  context.read<CounterBloc>().add(Decrement());
                }, child: const Icon(Icons.remove)),
                ElevatedButton(onPressed: (){
                  context.read<CounterBloc>().add(Increment());
                }, child: const Icon(Icons.add))
              ],
            )
            ],
          ),
        ));
  }
}
