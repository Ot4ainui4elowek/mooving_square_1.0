import 'package:flutter/material.dart';
import 'package:moov_square/presentation/router_page/router.dart';

class RouterScreen extends StatelessWidget {
  const RouterScreen({super.key, required title}) : _title = title;

  final String _title;

  @override
  Widget build(BuildContext context) {
    void navigateTo(String route) {
      Navigator.of(context).pushNamed(route);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.all(10),
                child: FilledButton(
                  child: const Text('Бегающий квадрат'),
                  onPressed: () => navigateTo(Routes.squareApp),
                )),
            FilledButton(
              onPressed: () => navigateTo(Routes.userForm),
              child: const Text('Формочка пользователя'),
            )
          ],
        ),
      ),
    );
  }
}
