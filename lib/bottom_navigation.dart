import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:izisoft_flutter_test_lenguyenngocdong/home_page.dart';

class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({Key? key}) : super(key: key);

  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
  int _currentIndex = 0;
  List page = [HomePage(), HomePage(), HomePage(), HomePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.black), label: '',),
          BottomNavigationBarItem(icon: Icon(Icons.search, color: Colors.black), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite, color: Colors.black), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.people, color: Colors.black), label: '')
        ],
        body: body[_currentIndex],
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}
