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
        onTap: (value) {
          setState(() {
            _currentIndex = value;
            switch (value) {
              case 0:
                const HomePage();
                break;
              case 1:
                const HomePage();
                break;
              case 2:
                const HomePage();
                break;
              case 3:
                const HomePage();
                break;
              default:
                const HomePage();
                break;
            }
          });
        },
      ),
    );
  }
}
