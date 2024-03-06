import 'package:flutter/material.dart';
import 'package:moov_square/presentation/navigator/navigator_screen.dart';
import 'package:moov_square/presentation/square_page/square_screen.dart';
import 'package:moov_square/presentation/user_form/user_form.dart';
import 'package:moov_square/theme.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      routes: {
        '/': (context) => const NavigatorScreen(title: 'Выбирай'),
        '/square-app': (context) => const SquareApp(),
        '/user-form': (context) => UserForm(),
      },
      initialRoute: '/',
    );
  }
}
