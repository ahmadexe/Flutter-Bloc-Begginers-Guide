part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class Increment implements CounterEvent {

}

class Decrement implements CounterEvent {
  
}
