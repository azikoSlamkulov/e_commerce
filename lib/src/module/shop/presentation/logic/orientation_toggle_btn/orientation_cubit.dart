import 'package:flutter_bloc/flutter_bloc.dart';

part 'orientation_state.dart';

// class OrientationCubit extends Cubit<OrientationState> {
//   OrientationCubit() : super(OrientationInitial());
// }

class OrientationCubit extends Cubit<OrientationState> {
  OrientationCubit() : super(const OrientationState(orientation: true));

  void getOrientation() =>
      emit(OrientationState(orientation: !state.orientation));
}
