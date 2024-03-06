import 'package:flutter/material.dart';

class NavigatorScreen extends StatelessWidget {
  const NavigatorScreen({super.key, required title}) : _title = title;

  final _title;

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () =>
                      Navigator.of(context).pushNamed('/square-app'),
                )),
            FilledButton(
              onPressed: () => Navigator.of(context).pushNamed('/user-form'),
              child: const Text('Формочка пользователя'),
            )
          ],
        ),
      ),
    );
  }
}
