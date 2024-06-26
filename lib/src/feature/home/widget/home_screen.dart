import 'package:flutter/material.dart';
import 'package:sizzle_starter/src/feature/home/widget/map_screen.dart';
// import 'package:sizzle_starter/src/core/utils/layout/layout.dart';

import 'package:sizzle_starter/src/feature/news/widget/news_screen.dart';
import 'package:sizzle_starter/src/feature/settings/widget/settings_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedPageIndex = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: (value) => setState(() {
            () => _selectedPageIndex = value;
          }),
          children: const [
            NewsScreen(),
            MapScreen(),
            SettingsScreen(),
          ],
        ),
        bottomNavigationBar: DecoratedBox(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black38, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              selectedFontSize: 20,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedIconTheme: const IconThemeData(color: Colors.black, size: 40,),
              selectedItemColor: Colors.black,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
              currentIndex: _selectedPageIndex,
              onTap: _openPage,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.newspaper),
                  label: 'News',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.map),
                  label: 'Map',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                )
              ],
            ),
          ),
        ),
      );

  void _openPage(int index) {
    setState(() => _selectedPageIndex = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }
}
