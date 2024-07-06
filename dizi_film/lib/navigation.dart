import 'package:dizi_film/home_page.dart';
import 'package:dizi_film/profile.dart';
import 'package:dizi_film/yeni_ana.dart';
import 'package:flutter/material.dart';

class YonlendirButon extends StatefulWidget {
  const YonlendirButon({Key? key}) : super(key: key);

  @override
  State<YonlendirButon> createState() => _YonlendirButonState();
}

class _YonlendirButonState extends State<YonlendirButon> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    Yenisi(),
    HomePage(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb_outline),
            label: 'Suggestion',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.yellow.shade400,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
      ),
    );
  }
}
