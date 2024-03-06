import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  UserForm({super.key});

  final title = 'Форма';

  final nameFieldController = TextEditingController();
  final surNameFieldController = TextEditingController();

  void _sayHi(context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Привет!'),
        content: Text(
            'Привет, ${nameFieldController.text} ${surNameFieldController.text}!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextField(
                  controller: nameFieldController,
                  decoration: const InputDecoration(
                    labelText: 'Имя',
                  ),
                ),
                TextField(
                  controller: surNameFieldController,
                  decoration: const InputDecoration(
                    labelText: 'Фамилия',
                  ),
                ),
              ],
            ),
            FilledButton(
              onPressed: () => _sayHi(context),
              child: const Text('Поприветствовать'),
            )
          ],
        ),
      ),
    );
  }
}