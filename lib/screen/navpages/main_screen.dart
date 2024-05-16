import 'package:flutter/material.dart';
import 'package:travelapp/screen/navpages/bar_screen.dart';
import 'package:travelapp/screen/home_screen.dart';
import 'package:travelapp/screen/navpages/profile_screen.dart';
import 'package:travelapp/screen/navpages/search_screen.dart';

class MianScreen extends StatefulWidget {
  const MianScreen({Key? key}) : super(key: key);

  @override
  State<MianScreen> createState() => _MianScreenState();
}

class _MianScreenState extends State<MianScreen> {
  final List pages = [
    HomeScreen(),
    BarScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        elevation: 0,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart), label: "Item-bar"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
