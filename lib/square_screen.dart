import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SquareScreen extends StatefulWidget {
  const SquareScreen({super.key});
  @override
  State<SquareScreen> createState() => _SquareScreenState();
}

class _SquareScreenState extends State<SquareScreen> {
  final List<List<bool>> _squaresBoard = [
    [true, false, false],
    [false, false, false],
    [false, false, false],
  ];

  int x = 0;
  int y = 0;

  void moove(int row, int col) {
    setState(() {
      if (row != -1 && row != 3 && col != -1 && col != 3) {
        _squaresBoard[y][x] = _squaresBoard[row][col];
        _squaresBoard[row][col] = true;
        x = col;
        y = row;
      } else {
        debugPrint('out of range');
      }
    });
  }

  Widget _buildSquare(int row, int col) {
    bool value = _squaresBoard[row][col];
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 50,
        height: 50,
        color: value ? Theme.of(context).primaryColor : Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSquare(0, 0),
                  _buildSquare(0, 1),
                  _buildSquare(0, 2),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSquare(1, 0),
                  _buildSquare(1, 1),
                  _buildSquare(1, 2),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSquare(2, 0),
                  _buildSquare(2, 1),
                  _buildSquare(2, 2),
                ],
              ),
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
                    onPressed: () => moove(y - 1, x),
                    child: const Icon(Icons.arrow_circle_up),
                    backgroundColor: y == 0 ? Colors.grey : theme.primaryColor,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    onPressed: () => moove(y, x - 1),
                    child: const Icon(Icons.arrow_circle_left_outlined),
                    backgroundColor: x == 0 ? Colors.grey : theme.primaryColor,
                  ),
                  FloatingActionButton(
                    onPressed: () => moove(y, x + 1),
                    child: const Icon(Icons.arrow_circle_right_outlined),
                    backgroundColor: x == 2 ? Colors.grey : theme.primaryColor,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () => moove(y + 1, x),
                    child: const Icon(Icons.arrow_circle_down),
                    backgroundColor: y == 2 ? Colors.grey : theme.primaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
