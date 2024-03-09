import 'package:flutter/material.dart';
import 'package:moov_square/presentation/cube_page/widgets/cube_widget.dart';

class CubeScreen extends StatelessWidget {
  const CubeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Бегающий квадрат',
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: const CubeWidget(),
    );
  }
}
