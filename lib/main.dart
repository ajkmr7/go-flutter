// Package Dependencies
import 'package:first_app/widgets/view_controller_widget.dart';
import 'package:flutter/material.dart';

// Theme
import './resources/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyTheme.darkTheme(),
      home: const ViewControllerWidget(),
    );
  }
}
