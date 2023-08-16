// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:homepage/pages/home_page.dart';
import 'package:homepage/pages/note_page.dart';

class CurrentPage extends StatefulWidget {
  const CurrentPage({super.key});

  @override
  State<CurrentPage> createState() => _CurrentPageState();
}

class _CurrentPageState extends State<CurrentPage> {
  int _currentindex = 0;
  @override
  Widget build(BuildContext context) {
    void _navigateBottomBar(int index) {
      setState(() {
        _currentindex = index;
      });
    }

    final List<Widget> _pages = [
      HomePage(),
      NotePage(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        type: BottomNavigationBarType.fixed,
        onTap: _navigateBottomBar,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.purple[800],
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined, color: Colors.purple[800]),
            label: "",
          ),
        ],
      ),
      body: _pages[_currentindex],
    );
  }
}
