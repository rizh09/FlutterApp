import 'package:convid19/view/GiphyScreen.dart';
import 'package:flutter/material.dart';

class BottomBarScreen extends StatefulWidget {
  @override
  BottomBar createState() => BottomBar();
}

class BottomBar extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _children = [
    GiphyScreen(),
    Center(
      child: Text("2"),
    ),
    Center(
      child: Text("3"),
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[800],
        title: const Text('Code Lab'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _children,
        // children: _children[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            title: Text('Giphy'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            title: Text('News'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
