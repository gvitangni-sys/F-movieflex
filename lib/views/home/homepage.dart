import 'package:flutter/material.dart';
import 'package:movieflex/navigation/pages.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getAppPages()[currentPageIndex],
      bottomNavigationBar: bottomNavigation(),
    );
  }

  Widget bottomNavigation() => NavigationBar(
    elevation: 0,
    selectedIndex: currentPageIndex,
    onDestinationSelected: (int index) {
      setState(() {
        currentPageIndex = index;
      });
    },
    destinations: const [
      NavigationDestination(
        icon: Icon(Icons.home_outlined),
        selectedIcon: Icon(Icons.home),
        label: "Home",
      ),
      NavigationDestination(
        icon: Icon(Icons.explore_outlined),
        selectedIcon: Icon(Icons.explore),
        label: "Explore",
      ),
      NavigationDestination(
        icon: Icon(Icons.bookmarks_outlined),
        selectedIcon: Icon(Icons.bookmarks),
        label: "My List",
      ),
      NavigationDestination(
        icon: Icon(Icons.file_download_outlined),
        selectedIcon: Icon(Icons.file_download),
        label: "Downloads",
      ),
      NavigationDestination(
        icon: Icon(Icons.person_outline),
        selectedIcon: Icon(Icons.person),
        label: "Profile",
      ),
    ],
  );
}
