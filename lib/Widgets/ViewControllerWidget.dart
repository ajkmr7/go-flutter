// Package Dependencies
import 'package:flutter/material.dart';

// Widgets
import 'package:first_app/Widgets/Screens/HomeWidget.dart';
import 'package:first_app/Widgets/Screens/ProfileWidget.dart';

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
      presentingBodyWidget(_selectedIndex);
    });
  }

  PreferredSizeWidget? presentingAppBarWidget(int index) {
    switch (index) {
      case 0:
        return AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "It All Starts Here",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Text(
                    "Chennai",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Icon(Icons.chevron_right, color: Colors.grey, size: 14),
                ],
              ),
            ],
          ),
          backgroundColor: const Color.fromRGBO(28, 46, 74, 0.9),
          actions: const [
            Icon(
              Icons.search,
            ),
            SizedBox(
              width: 12,
            ),
            Icon(Icons.notifications_outlined),
            SizedBox(
              width: 12,
            ),
          ],
          toolbarHeight: 72,
        );
      case 1:
        return AppBar(
          backgroundColor: const Color.fromRGBO(28, 46, 74, 0.9),
          toolbarHeight: 72,
        );
    }
    return null;
  }

  Widget? presentingBodyWidget(int index) {
    switch (index) {
      case 0:
        return const HomeWidget();
      case 1:
        return const ProfileWidget();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: presentingAppBarWidget(_selectedIndex),
      body: presentingBodyWidget(_selectedIndex),
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
