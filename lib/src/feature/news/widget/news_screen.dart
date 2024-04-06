import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(12),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(
              color: Colors.black12,
              width: 0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 0,
                blurRadius: 3,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          child: Container(
            margin: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: const Color(0xffE7F2F9),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  CupertinoIcons.search,
                  size: 30,
                ),
                hintText: 'Выберите локацию',
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight + 50),
          child: Padding(
            padding: EdgeInsets.only(top: 50),
            child: CustomAppBar(),
          ),
        ), // Используем
        body: Center(
          child: Text('News'),
        ),
      );
}
