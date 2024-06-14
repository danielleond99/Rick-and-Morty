import 'package:flutter/material.dart';

import 'package:rick_and_morty/screens/export.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Rick and Morty',
      home: SplashScreen(),
    );
  }
}
