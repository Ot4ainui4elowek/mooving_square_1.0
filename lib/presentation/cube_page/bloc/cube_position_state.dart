part of 'cube_position_bloc.dart';

class CubeState {}

abstract class CubePosition {
  static int x = 0;
  static int y = 0;
}

class CubeMoovingState extends CubeState {
  CubeMoovingState({required this.x, required this.y});
  final int x;
  final int y;
}
