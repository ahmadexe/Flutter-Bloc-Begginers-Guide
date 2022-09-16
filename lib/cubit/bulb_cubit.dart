import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bulb_state.dart';

class BulbCubit extends Cubit<BulbState> {
  BulbCubit() : super(BulbState(isOn:false));
  void on() => emit(BulbState(isOn: true));
  void off() => emit(BulbState(isOn: false));
}
