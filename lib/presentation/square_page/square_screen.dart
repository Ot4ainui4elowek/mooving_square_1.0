import 'package:flutter/material.dart';
import 'package:moov_square/presentation/square_page/square_widget.dart';

class SquareApp extends StatelessWidget {
  const SquareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Square mooving app',
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: const SquareWidget(),
    );
  }
}
