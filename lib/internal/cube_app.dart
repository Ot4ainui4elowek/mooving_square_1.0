import 'package:flutter/material.dart';
import 'package:moov_square/presentation/router_page/router.dart';
import 'package:moov_square/internal/theme.dart';

class CubeApp extends StatelessWidget {
  const CubeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      routes: routes,
      initialRoute: Routes.routerPage,
    );
  }
}
