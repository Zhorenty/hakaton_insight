import 'package:flutter/material.dart';
import 'package:sizzle_starter/src/feature/auth/widget/login_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Настройки'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: const Text(
                'Аккаунт',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Действие при нажатии
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Профиль'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Действие при нажатии
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Пароль'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Действие при нажатии
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Уведомления'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Действие при нажатии
              },
            ),
            ListTile(
              title: const Text(
                'Еще',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Действие при нажатии
              },
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Тема'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Действие при нажатии
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Помощь'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Действие при нажатии
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    // ignore: inference_failure_on_instance_creation
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red, // Text Color
                ),
                child: const Text(
                  'Выйти из аккаунта',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
