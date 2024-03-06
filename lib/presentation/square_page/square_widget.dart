import 'package:flutter/material.dart';

class SquareWidgetLogic extends ChangeNotifier {
  final List<List<bool>> _squaresBoard = [
    [true, false, false],
    [false, false, false],
    [false, false, false],
  ];

  int x = 0;
  int y = 0;

  void moove(int row, int col) {
    if (row != -1 && row != 3 && col != -1 && col != 3) {
      _squaresBoard[y][x] = _squaresBoard[row][col];
      _squaresBoard[row][col] = true;
      x = col;
      y = row;
    } else {
      debugPrint('out of range');
    }
    notifyListeners();
  }

  Widget _buildSquare(int row, int col) {
    bool value = _squaresBoard[row][col];
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: value
            ? const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                color: Colors.deepOrangeAccent,
              )
            : const BoxDecoration(),
        width: 50,
        height: 50,
        //color: value ? Colors.amber : Colors.transparent,
      ),
    );
  }
}

class SquareWidget extends StatefulWidget {
  const SquareWidget({super.key});
  @override
  State<SquareWidget> createState() => _SquareWidgetState();
}

class _SquareWidgetState extends State<SquareWidget> {
  @override
  Widget build(BuildContext context) {
    final _squareScreenLogic = SquareWidgetLogic();

    final theme = Theme.of(context);

    return ListenableBuilder(
      listenable: _squareScreenLogic,
      builder: (context, child) => Column(
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
                    _squareScreenLogic._buildSquare(0, 0),
                    _squareScreenLogic._buildSquare(0, 1),
                    _squareScreenLogic._buildSquare(0, 2),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _squareScreenLogic._buildSquare(1, 0),
                    _squareScreenLogic._buildSquare(1, 1),
                    _squareScreenLogic._buildSquare(1, 2),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _squareScreenLogic._buildSquare(2, 0),
                    _squareScreenLogic._buildSquare(2, 1),
                    _squareScreenLogic._buildSquare(2, 2),
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
                      onPressed: () => _squareScreenLogic.moove(
                          _squareScreenLogic.y - 1, _squareScreenLogic.x),
                      child: const Icon(Icons.arrow_circle_up),
                      backgroundColor: _squareScreenLogic.y == 0
                          ? Colors.grey
                          : theme.primaryColor,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                      onPressed: () => _squareScreenLogic.moove(
                          _squareScreenLogic.y, _squareScreenLogic.x - 1),
                      child: const Icon(Icons.arrow_circle_left_outlined),
                      backgroundColor: _squareScreenLogic.x == 0
                          ? Colors.grey
                          : theme.primaryColor,
                    ),
                    FloatingActionButton(
                      onPressed: () => _squareScreenLogic.moove(
                          _squareScreenLogic.y, _squareScreenLogic.x + 1),
                      child: const Icon(Icons.arrow_circle_right_outlined),
                      backgroundColor: _squareScreenLogic.x == 2
                          ? Colors.grey
                          : theme.primaryColor,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      onPressed: () => _squareScreenLogic.moove(
                          _squareScreenLogic.y + 1, _squareScreenLogic.x),
                      child: const Icon(Icons.arrow_circle_down),
                      backgroundColor: _squareScreenLogic.y == 2
                          ? Colors.grey
                          : theme.primaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
