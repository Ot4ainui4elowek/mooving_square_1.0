import 'package:flutter_bloc/flutter_bloc.dart';
part 'cube_position_event.dart';
part 'cube_position_state.dart';

class CubeBloc extends Bloc<CubeEvent, CubeState> {
  CubeBloc() : super(CubeMoovingState(x: 0, y: 0)) {
    on<CubeStateInitialEvent>((event, emit) {
      emit(CubeMoovingState(x: 0, y: 0));
    });
    on<MooveTheCubeUp>((event, emit) {
      if (CubePosition.y > 0) {
        CubePosition.y--;
      }
      emit(CubeMoovingState(x: CubePosition.x, y: CubePosition.y));
    });
    on<MooveTheCubeDown>((event, emit) {
      if (CubePosition.y < 2) {
        CubePosition.y++;
      }
      emit(CubeMoovingState(x: CubePosition.x, y: CubePosition.y));
    });
    on<MooveTheCubeLeft>((event, emit) {
      if (CubePosition.x > 0) {
        CubePosition.x--;
      }
      emit(CubeMoovingState(x: CubePosition.x, y: CubePosition.y));
    });
    on<MooveTheCubeRight>((event, emit) {
      if (CubePosition.x < 2) {
        CubePosition.x++;
      }
      emit(CubeMoovingState(x: CubePosition.x, y: CubePosition.y));
    });
  }
}
