import 'package:flutter/material.dart';
import 'package:sizzle_starter/src/feature/auth/widget/login_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Настройки'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text(
                'Аккаунт',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Действие при нажатии
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Профиль'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Действие при нажатии
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Пароль'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Действие при нажатии
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Уведомления'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Действие при нажатии
              },
            ),
            ListTile(
              title: Text(
                'Еще',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Действие при нажатии
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Тема'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Действие при нажатии
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Помощь'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Действие при нажатии
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red, // Text Color
                ),
                child: Text(
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