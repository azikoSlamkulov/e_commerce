import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(count: 1));

  void increment() => emit(CounterState(count: state.count + 1));

  void decrement() {
    if (state.count > 1) {
      emit(CounterState(count: state.count - 1));
    }
  }
}

// class CounterCubit extends Cubit<CounterState> {
//   CounterCubit() : super(const CounterInitialState(count: 1));

//   void increment() {
//     final count = state. + 1;
//     emit(CounterInitialState(count: state.count + 1));
//   }

//   void decrement() {
//     if (state.count > 1) {
//       emit(CounterInitialState(count: state.count - 1));
//     }
//   }
// }
