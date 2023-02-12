// Package Dependencies
import 'package:first_app/Widgets/Screens/HomeWidget.dart';
import 'package:first_app/Widgets/Screens/ProfileWidget.dart';
import 'package:flutter/material.dart';

class ViewControllerWidget extends StatefulWidget {
  const ViewControllerWidget({super.key});

  @override
  State<ViewControllerWidget> createState() => _ViewControllerWidgetState();
}

class _ViewControllerWidgetState extends State<ViewControllerWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      presentingWidget(_selectedIndex);
    });
  }

  Widget presentingWidget(int index) {
    switch (index) {
      case 0:
        return const HomeWidget();
      case 1:
        return const ProfileWidget();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: presentingWidget(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red[400],
        unselectedItemColor: Colors.grey,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
