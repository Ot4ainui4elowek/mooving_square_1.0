import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moov_square/presentation/cube_page/bloc/cube_position_bloc.dart';

class CubeWidget extends StatefulWidget {
  const CubeWidget({super.key});
  @override
  State<CubeWidget> createState() => _CubeWidgetState();
}

class _CubeWidgetState extends State<CubeWidget> {
  final List<MainAxisAlignment> _cubePosition = [
    MainAxisAlignment.start,
    MainAxisAlignment.center,
    MainAxisAlignment.end,
  ];

  final _cubePositionBloc = CubeBloc();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<CubeBloc, CubeState>(
        bloc: _cubePositionBloc,
        builder: (context, state) {
          if (state is CubeMoovingState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Column(
                    mainAxisAlignment: _cubePosition[state.y],
                    children: [
                      Row(
                        mainAxisAlignment: _cubePosition[state.x],
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            color: Colors.amber,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsetsDirectional.all(50),
                  height: 200,
                  width: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            onPressed: () =>
                                _cubePositionBloc.add(MooveTheCubeUp()),
                            backgroundColor:
                                state.y == 0 ? Colors.grey : theme.primaryColor,
                            child: const Icon(Icons.arrow_circle_up),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FloatingActionButton(
                            onPressed: () =>
                                _cubePositionBloc.add(MooveTheCubeLeft()),
                            backgroundColor:
                                state.x == 0 ? Colors.grey : theme.primaryColor,
                            child: const Icon(Icons.arrow_circle_left_outlined),
                          ),
                          FloatingActionButton(
                            onPressed: () =>
                                _cubePositionBloc.add(MooveTheCubeRight()),
                            backgroundColor:
                                state.x == 2 ? Colors.grey : theme.primaryColor,
                            child:
                                const Icon(Icons.arrow_circle_right_outlined),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            onPressed: () =>
                                _cubePositionBloc.add(MooveTheCubeDown()),
                            backgroundColor:
                                state.y == 2 ? Colors.grey : theme.primaryColor,
                            child: const Icon(Icons.arrow_circle_down),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else
            return Text('Упс! Что-то пошло не так...');
        });
  }
}
